# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/xyz_d50.dart
        class XyzD50
          include Space

          def bounded?
            false
          end

          def initialize
            super('xyz-d50', Utils::XYZ_CHANNELS)
          end

          def convert(dest, x, y, z, alpha, # rubocop:disable Naming/MethodParameterName
                      missing_lightness: false,
                      missing_chroma: false,
                      missing_hue: false,
                      missing_a: false,
                      missing_b: false)
            case dest
            when LAB, LCH
              f0 = _convert_component_to_lab_f((x.nil? ? 0 : x) / Conversions::D50[0])
              f1 = _convert_component_to_lab_f((y.nil? ? 0 : y) / Conversions::D50[1])
              f2 = _convert_component_to_lab_f((z.nil? ? 0 : z) / Conversions::D50[2])
              lightness = missing_lightness ? nil : (116 * f1) - 16
              a = 500 * (f0 - f1)
              b = 200 * (f1 - f2)

              if dest == LAB
                Color.send(:_for_space,
                           dest,
                           lightness,
                           missing_a ? nil : a,
                           missing_b ? nil : b,
                           alpha)
              else
                Utils.lab_to_lch(dest, lightness, a, b, alpha, missing_chroma:, missing_hue:)
              end
            else
              convert_linear(dest, x, y, z, alpha,
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

          def _convert_component_to_lab_f(component)
            if component > Utils::LAB_EPSILON
              Math.cbrt(component)
            else
              ((Utils::LAB_KAPPA * component) + 16) / 116.0
            end
          end

          def transformation_matrix(dest)
            case dest
            when A98_RGB
              Conversions::XYZ_D50_TO_LINEAR_A98_RGB
            when DISPLAY_P3
              Conversions::XYZ_D50_TO_LINEAR_DISPLAY_P3
            when LMS
              Conversions::XYZ_D50_TO_LMS
            when PROPHOTO_RGB
              Conversions::XYZ_D50_TO_LINEAR_PROPHOTO_RGB
            when REC2020
              Conversions::XYZ_D50_TO_LINEAR_REC2020
            when RGB, SRGB, SRGB_LINEAR
              Conversions::XYZ_D50_TO_LINEAR_SRGB
            when XYZ_D65
              Conversions::XYZ_D50_TO_XYZ_D65
            else
              super
            end
          end
        end

        private_constant :XyzD50

        XYZ_D50 = XyzD50.new
      end
    end
  end
end
