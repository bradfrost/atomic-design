# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/srgb_linear.dart
        class SrgbLinear
          include Space

          def bounded?
            true
          end

          def initialize
            super('srgb-linear', Utils::RGB_CHANNELS)
          end

          def convert(dest, red, green, blue, alpha)
            case dest
            when HSL, HWB, RGB, SRGB
              SRGB.convert(
                dest,
                red.nil? ? nil : Utils.srgb_and_display_p3_from_linear(red),
                green.nil? ? nil : Utils.srgb_and_display_p3_from_linear(green),
                blue.nil? ? nil : Utils.srgb_and_display_p3_from_linear(blue),
                alpha
              )
            else
              super
            end
          end

          def to_linear(channel)
            channel
          end

          def from_linear(channel)
            channel
          end

          private

          def transformation_matrix(dest)
            case dest
            when A98_RGB
              Conversions::LINEAR_SRGB_TO_LINEAR_A98_RGB
            when DISPLAY_P3
              Conversions::LINEAR_SRGB_TO_LINEAR_DISPLAY_P3
            when PROPHOTO_RGB
              Conversions::LINEAR_SRGB_TO_LINEAR_PROPHOTO_RGB
            when REC2020
              Conversions::LINEAR_SRGB_TO_LINEAR_REC2020
            when XYZ_D65
              Conversions::LINEAR_SRGB_TO_XYZ_D65
            when XYZ_D50
              Conversions::LINEAR_SRGB_TO_XYZ_D50
            when LMS
              Conversions::LINEAR_SRGB_TO_LMS
            else
              super
            end
          end
        end

        private_constant :SrgbLinear

        SRGB_LINEAR = SrgbLinear.new
      end
    end
  end
end
