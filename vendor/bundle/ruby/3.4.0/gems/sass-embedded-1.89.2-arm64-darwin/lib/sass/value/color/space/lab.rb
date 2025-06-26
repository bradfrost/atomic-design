# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/lab.dart
        class Lab
          include Space

          def bounded?
            false
          end

          def initialize
            super('lab', [
              LinearChannel.new('lightness', 0, 100, lower_clamped: true, upper_clamped: true).freeze,
              LinearChannel.new('a', -125, 125).freeze,
              LinearChannel.new('b', -125, 125).freeze
            ].freeze)
          end

          def convert(dest, lightness, a, b, alpha, # rubocop:disable Naming/MethodParameterName
                      missing_chroma: false, missing_hue: false)
            case dest
            when LAB
              powerless_ab = lightness.nil? || FuzzyMath.equals?(lightness, 0)
              Color.send(
                :_for_space,
                dest,
                lightness,
                a.nil? || powerless_ab ? nil : a,
                b.nil? || powerless_ab ? nil : b,
                alpha
              )
            when LCH
              Utils.lab_to_lch(dest, lightness, a, b, alpha)
            else
              missing_lightness = lightness.nil?
              lightness = 0 if missing_lightness

              f1 = (lightness + 16) / 116.0

              XYZ_D50.convert(
                dest,
                _convert_f_to_x_or_z(((a.nil? ? 0 : a) / 500.0) + f1) * Conversions::D50[0],
                (if lightness > Utils::LAB_KAPPA * Utils::LAB_EPSILON
                   (((lightness + 16) / 116.0)**3)
                 else
                   lightness / Utils::LAB_KAPPA
                 end) * Conversions::D50[1],
                _convert_f_to_x_or_z(f1 - ((b.nil? ? 0 : b) / 200.0)) * Conversions::D50[2],
                alpha,
                missing_lightness:,
                missing_chroma:,
                missing_hue:,
                missing_a: a.nil?,
                missing_b: b.nil?
              )
            end
          end

          private

          def _convert_f_to_x_or_z(component)
            cubed = component**3
            cubed > Utils::LAB_EPSILON ? cubed : ((116 * component) - 16) / Utils::LAB_KAPPA
          end
        end

        private_constant :Lab

        LAB = Lab.new
      end
    end
  end
end
