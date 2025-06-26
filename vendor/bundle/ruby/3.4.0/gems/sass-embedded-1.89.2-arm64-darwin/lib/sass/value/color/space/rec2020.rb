# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/rec2020.dart
        class Rec2020
          include Space

          # A constant used in the rec2020 gamma encoding/decoding functions.
          ALPHA = 1.09929682680944

          private_constant :ALPHA

          # A constant used in the rec2020 gamma encoding/decoding functions.
          BETA = 0.018053968510807

          private_constant :BETA

          def bounded?
            true
          end

          def initialize
            super('rec2020', Utils::RGB_CHANNELS)
          end

          def to_linear(channel)
            abs = channel.abs
            abs < BETA * 4.5 ? channel / 4.5 : (channel <=> 0) * (((abs + ALPHA - 1) / ALPHA)**(1 / 0.45))
          end

          def from_linear(channel)
            abs = channel.abs
            abs > BETA ? (channel <=> 0) * ((ALPHA * (abs**0.45)) - (ALPHA - 1)) : 4.5 * channel
          end

          private

          def transformation_matrix(dest)
            case dest
            when A98_RGB
              Conversions::LINEAR_REC2020_TO_LINEAR_A98_RGB
            when DISPLAY_P3
              Conversions::LINEAR_REC2020_TO_LINEAR_DISPLAY_P3
            when LMS
              Conversions::LINEAR_REC2020_TO_LMS
            when PROPHOTO_RGB
              Conversions::LINEAR_REC2020_TO_LINEAR_PROPHOTO_RGB
            when RGB, SRGB, SRGB_LINEAR
              Conversions::LINEAR_REC2020_TO_LINEAR_SRGB
            when XYZ_D50
              Conversions::LINEAR_REC2020_TO_XYZ_D50
            when XYZ_D65
              Conversions::LINEAR_REC2020_TO_XYZ_D65
            else
              super
            end
          end
        end

        private_constant :Rec2020

        REC2020 = Rec2020.new
      end
    end
  end
end
