# frozen_string_literal: true

module Sass
  module Value
    class Color
      # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/channel.dart
      class ColorChannel
        # @return [::String]
        attr_reader :name

        # @return [::Boolean]
        def polar_angle?
          @polar_angle
        end

        # @return [::String, nil]
        attr_reader :associated_unit

        # @param name [::String]
        # @param polar_angle [::Boolean]
        # @param associated_unit [::String]
        def initialize(name, polar_angle:, associated_unit: nil)
          @name = name
          @polar_angle = polar_angle
          @associated_unit = associated_unit
        end

        # @return [::Boolean]
        def analogous?(other)
          case [name, other.name]
          in ['red' | 'x', 'red' | 'x'] |
             ['green' | 'y', 'green' | 'y'] |
             ['blue' | 'z', 'blue' | 'z'] |
             ['chroma' | 'saturation', 'chroma' | 'saturation'] |
             ['lightness', 'lightness'] |
             ['hue', 'hue']
            true
          else
            false
          end
        end
      end

      private_constant :ColorChannel

      # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/channel.dart
      class LinearChannel < ColorChannel
        # @return [Numeric]
        attr_reader :min, :max

        # @return [::Boolean]
        attr_reader :requires_percent, :lower_clamped, :upper_clamped

        # @param name [::String]
        # @param min [Numeric]
        # @param max [Numeric]
        # @param requires_percent [::Boolean]
        # @param lower_clamped [::Boolean]
        # @param upper_clamped [::Boolean]
        # @param conventionally_percent [::Boolean]
        def initialize(name, min, max, requires_percent: false, lower_clamped: false, upper_clamped: false,
                       conventionally_percent: nil)
          super(name,
                polar_angle: false,
                associated_unit: if conventionally_percent.nil? ? (min.zero? && max == 100) : conventionally_percent
                                   '%'
                                 end)
          @min = min
          @max = max
          @requires_percent = requires_percent
          @lower_clamped = lower_clamped
          @upper_clamped = upper_clamped
        end
      end

      private_constant :LinearChannel
    end
  end
end
