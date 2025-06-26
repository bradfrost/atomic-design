# frozen_string_literal: true

module Sass
  class Compiler
    class Host
      # The {LoggerRegistry} class.
      #
      # It stores logger and handles log events.
      class LoggerRegistry
        LOGGER_METHODS = %i[debug warn].freeze

        private_constant :LOGGER_METHODS

        def initialize(logger)
          logger = Struct.new(logger, methods: LOGGER_METHODS) if logger.is_a?(::Hash)
          @logger = logger
          @logger_respond_to_debug = logger.respond_to?(:debug)
          @logger_respond_to_warn = logger.respond_to?(:warn)
        end

        def log(event)
          case event.type
          when :DEBUG
            if @logger_respond_to_debug
              @logger.debug(event.message, DebugContext.new(event))
            else
              Kernel.warn(event.formatted)
            end
          when :DEPRECATION_WARNING, :WARNING
            if @logger_respond_to_warn
              @logger.warn(event.message, WarnContext.new(event))
            else
              Kernel.warn(event.formatted)
            end
          else
            raise ArgumentError, "Unknown LogEvent.type #{event.type}"
          end
        end

        # Contextual information passed to `debug`.
        class DebugContext
          # @return [Logger::SourceSpan, nil]
          attr_reader :span

          def initialize(event)
            @span = event.span.nil? ? nil : Logger::SourceSpan.new(event.span)
          end
        end

        private_constant :DebugContext

        # Contextual information passed to `warn`.
        class WarnContext < DebugContext
          # @return [Boolean]
          attr_reader :deprecation

          # @return [String, nil]
          attr_reader :deprecation_type

          # @return [String]
          attr_reader :stack

          def initialize(event)
            super
            @deprecation = event.type == :DEPRECATION_WARNING
            @deprecation_type = (event.deprecation_type if @deprecation)
            @stack = event.stack_trace
          end
        end

        private_constant :WarnContext
      end

      private_constant :LoggerRegistry
    end
  end
end
