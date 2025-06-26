# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/rgb.dart
        class Rgb
          include Space

          def bounded?
            true
          end

          def legacy?
            true
          end

          def initialize
            super('rgb', [
              LinearChannel.new('red', 0, 255, lower_clamped: true, upper_clamped: true).freeze,
              LinearChannel.new('green', 0, 255, lower_clamped: true, upper_clamped: true).freeze,
              LinearChannel.new('blue', 0, 255, lower_clamped: true, upper_clamped: true).freeze
            ].freeze)
          end

          def convert(dest, red, green, blue, alpha)
            SRGB.convert(
              dest,
              red.nil? ? nil : red / 255.0,
              green.nil? ? nil : green / 255.0,
              blue.nil? ? nil : blue / 255.0,
              alpha
            )
          end

          def to_linear(channel)
            Utils.srgb_and_display_p3_to_linear(channel / 255.0)
          end

          def from_linear(channel)
            Utils.srgb_and_display_p3_from_linear(channel) * 255
          end
        end

        private_constant :Rgb

        RGB = Rgb.new
      end
    end
  end
end
