# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/lms.dart
        class Lms
          include Space

          def bounded?
            false
          end

          def initialize
            super('lms', [
              LinearChannel.new('long', 0, 1).freeze,
              LinearChannel.new('medium', 0, 1).freeze,
              LinearChannel.new('short', 0, 1).freeze
            ].freeze)
          end

          def convert(dest, long, medium, short, alpha,
                      missing_lightness: false,
                      missing_chroma: false,
                      missing_hue: false,
                      missing_a: false,
                      missing_b: false)
            case dest
            when OKLAB
              long_scaled = Math.cbrt(long.nil? ? 0 : long)
              medium_scaled = Math.cbrt(medium.nil? ? 0 : medium)
              short_scaled = Math.cbrt(short.nil? ? 0 : short)

              Color.send(
                :_for_space,
                dest,
                unless missing_lightness
                  (Conversions::LMS_TO_OKLAB[0] * long_scaled) +
                    (Conversions::LMS_TO_OKLAB[1] * medium_scaled) +
                    (Conversions::LMS_TO_OKLAB[2] * short_scaled)
                end,
                unless missing_a
                  (Conversions::LMS_TO_OKLAB[3] * long_scaled) +
                    (Conversions::LMS_TO_OKLAB[4] * medium_scaled) +
                    (Conversions::LMS_TO_OKLAB[5] * short_scaled)
                end,
                unless missing_b
                  (Conversions::LMS_TO_OKLAB[6] * long_scaled) +
                    (Conversions::LMS_TO_OKLAB[7] * medium_scaled) +
                    (Conversions::LMS_TO_OKLAB[8] * short_scaled)
                end,
                alpha
              )
            when OKLCH
              long_scaled = Math.cbrt(long.nil? ? 0 : long)
              medium_scaled = Math.cbrt(medium.nil? ? 0 : medium)
              short_scaled = Math.cbrt(short.nil? ? 0 : short)

              Utils.lab_to_lch(
                dest,
                unless missing_lightness
                  (Conversions::LMS_TO_OKLAB[0] * long_scaled) +
                    (Conversions::LMS_TO_OKLAB[1] * medium_scaled) +
                    (Conversions::LMS_TO_OKLAB[2] * short_scaled)
                end,
                unless missing_a
                  (Conversions::LMS_TO_OKLAB[3] * long_scaled) +
                    (Conversions::LMS_TO_OKLAB[4] * medium_scaled) +
                    (Conversions::LMS_TO_OKLAB[5] * short_scaled)
                end,
                unless missing_b
                  (Conversions::LMS_TO_OKLAB[6] * long_scaled) +
                    (Conversions::LMS_TO_OKLAB[7] * medium_scaled) +
                    (Conversions::LMS_TO_OKLAB[8] * short_scaled)
                end,
                alpha
              )
            else
              convert_linear(dest, long, medium, short, alpha,
                             missing_lightness:,
                             missing_chroma:,
                             missing_hue:,
                             missing_a:,
                             missing_b:)
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
              Conversions::LMS_TO_LINEAR_A98_RGB
            when DISPLAY_P3
              Conversions::LMS_TO_LINEAR_DISPLAY_P3
            when PROPHOTO_RGB
              Conversions::LMS_TO_LINEAR_PROPHOTO_RGB
            when REC2020
              Conversions::LMS_TO_LINEAR_REC2020
            when RGB, SRGB, SRGB_LINEAR
              Conversions::LMS_TO_LINEAR_SRGB
            when XYZ_D50
              Conversions::LMS_TO_XYZ_D50
            when XYZ_D65
              Conversions::LMS_TO_XYZ_D65
            else
              super
            end
          end
        end

        private_constant :Lms

        LMS = Lms.new

        private_constant :LMS
      end
    end
  end
end
