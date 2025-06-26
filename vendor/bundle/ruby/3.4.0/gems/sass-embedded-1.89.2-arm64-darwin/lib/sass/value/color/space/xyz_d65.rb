# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/xyz_d65.dart
        class XyzD65
          include Space

          def bounded?
            false
          end

          def initialize
            super('xyz', Utils::XYZ_CHANNELS)
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
              Conversions::XYZ_D65_TO_LINEAR_A98_RGB
            when DISPLAY_P3
              Conversions::XYZ_D65_TO_LINEAR_DISPLAY_P3
            when LMS
              Conversions::XYZ_D65_TO_LMS
            when PROPHOTO_RGB
              Conversions::XYZ_D65_TO_LINEAR_PROPHOTO_RGB
            when REC2020
              Conversions::XYZ_D65_TO_LINEAR_REC2020
            when RGB, SRGB, SRGB_LINEAR
              Conversions::XYZ_D65_TO_LINEAR_SRGB
            when XYZ_D50
              Conversions::XYZ_D65_TO_XYZ_D50
            else
              super
            end
          end
        end

        private_constant :XyzD65

        XYZ_D65 = XyzD65.new
      end
    end
  end
end
