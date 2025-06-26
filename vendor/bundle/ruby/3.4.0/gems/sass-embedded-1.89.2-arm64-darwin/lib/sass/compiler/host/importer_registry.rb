# frozen_string_literal: true

module Sass
  class Compiler
    class Host
      # The {ImporterRegistry} class.
      #
      # It stores importers and handles import requests.
      class ImporterRegistry
        attr_reader :importers

        def initialize(importers, load_paths, alert_color:)
          @id = 0
          @importers_by_id = {}.compare_by_identity
          @importers = importers
                       .map { |importer| register(importer) }
                       .concat(
                         load_paths.map do |load_path|
                           EmbeddedProtocol::InboundMessage::CompileRequest::Importer.new(
                             path: File.absolute_path(load_path)
                           )
                         end
                       )

          @highlight = alert_color
        end

        IMPORTER_ATTRS = %i[non_canonical_scheme].freeze

        IMPORTER_METHODS = %i[canonicalize load find_file_url].freeze

        private_constant :IMPORTER_ATTRS, :IMPORTER_METHODS

        def register(importer)
          if importer.is_a?(Sass::NodePackageImporter)
            EmbeddedProtocol::InboundMessage::CompileRequest::Importer.new(
              node_package_importer: EmbeddedProtocol::NodePackageImporter.new(
                entry_point_directory: importer.instance_variable_get(:@entry_point_directory)
              )
            )
          else
            importer = Struct.new(importer, attrs: IMPORTER_ATTRS, methods: IMPORTER_METHODS) if importer.is_a?(::Hash)

            is_importer = importer.respond_to?(:canonicalize) && importer.respond_to?(:load)
            is_file_importer = importer.respond_to?(:find_file_url)

            raise ArgumentError, 'importer must be an Importer or a FileImporter' if is_importer == is_file_importer

            id = @id
            @id = id.next

            @importers_by_id[id] = importer
            if is_importer
              EmbeddedProtocol::InboundMessage::CompileRequest::Importer.new(
                importer_id: id,
                non_canonical_scheme: if importer.respond_to?(:non_canonical_scheme)
                                        Array(importer.non_canonical_scheme)
                                      else
                                        []
                                      end
              )
            else
              EmbeddedProtocol::InboundMessage::CompileRequest::Importer.new(
                file_importer_id: id
              )
            end
          end
        end

        def canonicalize(canonicalize_request)
          importer = @importers_by_id[canonicalize_request.importer_id]
          canonicalize_context = CanonicalizeContext.new(canonicalize_request)
          url = importer.canonicalize(canonicalize_request.url,
                                      canonicalize_context)&.to_s

          EmbeddedProtocol::InboundMessage::CanonicalizeResponse.new(
            id: canonicalize_request.id,
            url:,
            containing_url_unused: canonicalize_context.instance_variable_get(:@containing_url_unused)
          )
        rescue StandardError => e
          EmbeddedProtocol::InboundMessage::CanonicalizeResponse.new(
            id: canonicalize_request.id,
            error: e.full_message(highlight: @highlight, order: :top)
          )
        end

        IMPORTER_RESULT_ATTRS = %i[contents syntax source_map_url].freeze

        private_constant :IMPORTER_RESULT_ATTRS

        def import(import_request)
          importer = @importers_by_id[import_request.importer_id]
          importer_result = importer.load(import_request.url)
          importer_result = Struct.new(importer_result, attrs: IMPORTER_RESULT_ATTRS) if importer_result.is_a?(::Hash)

          EmbeddedProtocol::InboundMessage::ImportResponse.new(
            id: import_request.id,
            success: EmbeddedProtocol::InboundMessage::ImportResponse::ImportSuccess.new(
              contents: importer_result.contents.to_str,
              syntax: syntax_to_proto(importer_result.syntax),
              source_map_url: (importer_result.source_map_url&.to_s if importer_result.respond_to?(:source_map_url))
            )
          )
        rescue StandardError => e
          EmbeddedProtocol::InboundMessage::ImportResponse.new(
            id: import_request.id,
            error: e.full_message(highlight: @highlight, order: :top)
          )
        end

        def file_import(file_import_request)
          importer = @importers_by_id[file_import_request.importer_id]
          canonicalize_context = CanonicalizeContext.new(file_import_request)
          file_url = importer.find_file_url(file_import_request.url,
                                            canonicalize_context)&.to_s

          EmbeddedProtocol::InboundMessage::FileImportResponse.new(
            id: file_import_request.id,
            file_url:,
            containing_url_unused: canonicalize_context.instance_variable_get(:@containing_url_unused)
          )
        rescue StandardError => e
          EmbeddedProtocol::InboundMessage::FileImportResponse.new(
            id: file_import_request.id,
            error: e.full_message(highlight: @highlight, order: :top)
          )
        end

        def syntax_to_proto(syntax)
          case syntax&.to_sym
          when :scss
            EmbeddedProtocol::Syntax::SCSS
          when :indented
            EmbeddedProtocol::Syntax::INDENTED
          when :css
            EmbeddedProtocol::Syntax::CSS
          else
            raise ArgumentError, 'syntax must be one of :scss, :indented, :css'
          end
        end
      end

      private_constant :ImporterRegistry
    end
  end
end
