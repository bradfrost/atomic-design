# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/prophoto_rgb.dart
        class ProphotoRgb
          include Space

          def bounded?
            true
          end

          def initialize
            super('prophoto-rgb', Utils::RGB_CHANNELS)
          end

          def to_linear(channel)
            abs = channel.abs
            abs <= 16 / 512.0 ? channel / 16.0 : (channel <=> 0) * (abs**1.8)
          end

          def from_linear(channel)
            abs = channel.abs
            abs >= 1 / 512.0 ? (channel <=> 0) * (abs**(1 / 1.8)) : 16 * channel
          end

          private

          def transformation_matrix(dest)
            case dest
            when A98_RGB
              Conversions::LINEAR_PROPHOTO_RGB_TO_LINEAR_A98_RGB
            when DISPLAY_P3
              Conversions::LINEAR_PROPHOTO_RGB_TO_LINEAR_DISPLAY_P3
            when LMS
              Conversions::LINEAR_PROPHOTO_RGB_TO_LMS
            when REC2020
              Conversions::LINEAR_PROPHOTO_RGB_TO_LINEAR_REC2020
            when RGB, SRGB, SRGB_LINEAR
              Conversions::LINEAR_PROPHOTO_RGB_TO_LINEAR_SRGB
            when XYZ_D50
              Conversions::LINEAR_PROPHOTO_RGB_TO_XYZ_D50
            when XYZ_D65
              Conversions::LINEAR_PROPHOTO_RGB_TO_XYZ_D65
            else
              super
            end
          end
        end

        private_constant :ProphotoRgb

        PROPHOTO_RGB = ProphotoRgb.new
      end
    end
  end
end
