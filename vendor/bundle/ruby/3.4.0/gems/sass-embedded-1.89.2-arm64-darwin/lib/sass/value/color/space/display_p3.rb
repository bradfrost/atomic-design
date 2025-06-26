# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/display_p3.dart
        class DisplayP3
          include Space

          def bounded?
            true
          end

          def initialize
            super('display-p3', Utils::RGB_CHANNELS)
          end

          def to_linear(channel)
            Utils.srgb_and_display_p3_to_linear(channel)
          end

          def from_linear(channel)
            Utils.srgb_and_display_p3_from_linear(channel)
          end

          private

          def transformation_matrix(dest)
            case dest
            when A98_RGB
              Conversions::LINEAR_DISPLAY_P3_TO_LINEAR_A98_RGB
            when LMS
              Conversions::LINEAR_DISPLAY_P3_TO_LMS
            when PROPHOTO_RGB
              Conversions::LINEAR_DISPLAY_P3_TO_LINEAR_PROPHOTO_RGB
            when REC2020
              Conversions::LINEAR_DISPLAY_P3_TO_LINEAR_REC2020
            when RGB, SRGB, SRGB_LINEAR
              Conversions::LINEAR_DISPLAY_P3_TO_LINEAR_SRGB
            when XYZ_D50
              Conversions::LINEAR_DISPLAY_P3_TO_XYZ_D50
            when XYZ_D65
              Conversions::LINEAR_DISPLAY_P3_TO_XYZ_D65
            else
              super
            end
          end
        end

        private_constant :DisplayP3

        DISPLAY_P3 = DisplayP3.new
      end
    end
  end
end
