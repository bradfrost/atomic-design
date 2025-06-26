# frozen_string_literal: true

module Sass
  module Value
    class Color
      # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/interpolation_method.dart
      class InterpolationMethod
        # @return [Space]
        attr_reader :space

        # @return [Symbol, nil]
        attr_reader :hue

        # @param space [Space]
        # @param hue [Symbol]
        def initialize(space, hue = nil)
          @space = space
          @hue = if space.polar?
                   hue.nil? ? :shorter : hue
                 end

          return unless !space.polar? && !hue.nil?

          raise Sass::ScriptError,
                "Hue interpolation method may not be set for rectangular color space #{space.name}."
        end
      end

      private_constant :InterpolationMethod

      # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/interpolation_method.dart
      module HueInterpolationMethod
        class << self
          # @param name [::String]
          # @param argument_name [::String]
          # @return [Symbol]
          def from_name(name, argument_name = nil)
            case name
            when 'decreasing', 'increasing', 'longer', 'shorter'
              name.to_sym
            else
              raise Sass::ScriptError.new("Unknown hue interpolation method \"#{name}\".", argument_name)
            end
          end
        end
      end

      private_constant :HueInterpolationMethod
    end
  end
end
