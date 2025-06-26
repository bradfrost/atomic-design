# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/a98_rgb.dart
        class A98Rgb
          include Space

          def bounded?
            true
          end

          def initialize
            super('a98-rgb', Utils::RGB_CHANNELS)
          end

          def to_linear(channel)
            (channel <=> 0) * (channel.abs**(563 / 256.0))
          end

          def from_linear(channel)
            (channel <=> 0) * (channel.abs**(256 / 563.0))
          end

          private

          def transformation_matrix(dest)
            case dest
            when DISPLAY_P3
              Conversions::LINEAR_A98_RGB_TO_LINEAR_DISPLAY_P3
            when LMS
              Conversions::LINEAR_A98_RGB_TO_LMS
            when PROPHOTO_RGB
              Conversions::LINEAR_A98_RGB_TO_LINEAR_PROPHOTO_RGB
            when REC2020
              Conversions::LINEAR_A98_RGB_TO_LINEAR_REC2020
            when RGB, SRGB, SRGB_LINEAR
              Conversions::LINEAR_A98_RGB_TO_LINEAR_SRGB
            when XYZ_D50
              Conversions::LINEAR_A98_RGB_TO_XYZ_D50
            when XYZ_D65
              Conversions::LINEAR_A98_RGB_TO_XYZ_D65
            else
              super
            end
          end
        end

        private_constant :A98Rgb

        A98_RGB = A98Rgb.new
      end
    end
  end
end
