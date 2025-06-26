# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/srgb.dart
        class Srgb
          include Space

          def bounded?
            true
          end

          def initialize
            super('srgb', Utils::RGB_CHANNELS)
          end

          def convert(dest, red, green, blue, alpha,
                      missing_lightness: false,
                      missing_chroma: false,
                      missing_hue: false)
            case dest
            when HSL, HWB
              red = 0 if red.nil?
              green = 0 if green.nil?
              blue = 0 if blue.nil?

              min, max = [red, green, blue].minmax
              delta = max - min

              hue = if max == min
                      0.0
                    elsif max == red
                      (60.0 * (green - blue) / delta) + 360
                    elsif max == green
                      (60.0 * (blue - red) / delta) + 120
                    else # max == blue
                      (60.0 * (red - green) / delta) + 240
                    end

              if dest == HSL
                lightness = (min + max) / 2.0

                saturation = if [0, 1].include?(lightness)
                               0.0
                             else
                               100.0 * (max - lightness) / [lightness, 1 - lightness].min
                             end
                if saturation.negative?
                  hue += 180
                  saturation = saturation.abs
                end

                Color.send(
                  :for_space_internal,
                  dest,
                  missing_hue || FuzzyMath.equals?(saturation, 0) ? nil : hue % 360,
                  missing_chroma ? nil : saturation,
                  missing_lightness ? nil : lightness * 100,
                  alpha
                )
              else
                whiteness = min * 100
                blackness = 100 - (max * 100)

                Color.send(
                  :for_space_internal,
                  dest,
                  missing_hue || FuzzyMath.greater_than_or_equals?(whiteness + blackness, 100) ? nil : hue % 360,
                  whiteness,
                  blackness,
                  alpha
                )
              end
            when RGB
              Color.send(
                :_for_space,
                dest,
                red.nil? ? nil : red * 255,
                green.nil? ? nil : green * 255,
                blue.nil? ? nil : blue * 255,
                alpha
              )
            when SRGB_LINEAR
              Color.send(
                :_for_space,
                dest,
                red.nil? ? nil : to_linear(red),
                green.nil? ? nil : to_linear(green),
                blue.nil? ? nil : to_linear(blue),
                alpha
              )
            else
              convert_linear(dest, red, green, blue, alpha,
                             missing_lightness:,
                             missing_chroma:,
                             missing_hue:)
            end
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
              Conversions::LINEAR_SRGB_TO_LINEAR_A98_RGB
            when DISPLAY_P3
              Conversions::LINEAR_SRGB_TO_LINEAR_DISPLAY_P3
            when LMS
              Conversions::LINEAR_SRGB_TO_LMS
            when PROPHOTO_RGB
              Conversions::LINEAR_SRGB_TO_LINEAR_PROPHOTO_RGB
            when REC2020
              Conversions::LINEAR_SRGB_TO_LINEAR_REC2020
            when XYZ_D50
              Conversions::LINEAR_SRGB_TO_XYZ_D50
            when XYZ_D65
              Conversions::LINEAR_SRGB_TO_XYZ_D65
            else
              super
            end
          end
        end

        private_constant :Srgb

        SRGB = Srgb.new
      end
    end
  end
end
