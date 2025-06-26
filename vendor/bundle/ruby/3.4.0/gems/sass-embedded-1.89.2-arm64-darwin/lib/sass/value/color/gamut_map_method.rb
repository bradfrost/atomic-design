# frozen_string_literal: true

module Sass
  module Value
    class Color
      # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/gamut_map_method.dart
      module GamutMapMethod
        # @return [::String]
        attr_reader :name

        # @param name [::String]
        def initialize(name)
          @name = name
        end

        class << self
          # @param name [::String]
          # @param argument_name [::String]
          # @return [GamutMapMethod]
          def from_name(name, argument_name = nil)
            case name
            when 'clip'
              CLIP
            when 'local-minde'
              LOCAL_MINDE
            else
              raise Sass::ScriptError.new("Unknown gamut map method \"#{name}\".", argument_name)
            end
          end
        end

        # @param color [Color]
        # @return [Color]
        def map(color)
          raise NotImplementedError, "[BUG] gamut map method #{name} doesn't implement map."
        end
      end

      private_constant :GamutMapMethod
    end
  end
end

require_relative 'gamut_map_method/clip'
require_relative 'gamut_map_method/local_minde'
