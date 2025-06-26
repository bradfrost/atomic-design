# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/oklab.dart
        class Oklab
          include Space

          def bounded?
            false
          end

          def initialize
            super('oklab', [
              LinearChannel.new('lightness', 0, 1,
                                conventionally_percent: true, lower_clamped: true, upper_clamped: true).freeze,
              LinearChannel.new('a', -0.4, 0.4).freeze,
              LinearChannel.new('b', -0.4, 0.4).freeze
            ].freeze)
          end

          def convert(dest, lightness, a, b, alpha, # rubocop:disable Naming/MethodParameterName
                      missing_chroma: false, missing_hue: false)
            case dest
            when OKLCH
              Utils.lab_to_lch(dest, lightness, a, b, alpha)
            else
              missing_lightness = lightness.nil?
              missing_a = a.nil?
              missing_b = b.nil?

              lightness = 0 if missing_lightness
              a = 0 if missing_a
              b = 0 if missing_b

              LMS.convert(
                dest,
                ((Conversions::OKLAB_TO_LMS[0] * lightness) +
                 (Conversions::OKLAB_TO_LMS[1] * a) +
                 (Conversions::OKLAB_TO_LMS[2] * b))**3,
                ((Conversions::OKLAB_TO_LMS[3] * lightness) +
                 (Conversions::OKLAB_TO_LMS[4] * a) +
                 (Conversions::OKLAB_TO_LMS[5] * b))**3,
                ((Conversions::OKLAB_TO_LMS[6] * lightness) +
                 (Conversions::OKLAB_TO_LMS[7] * a) +
                 (Conversions::OKLAB_TO_LMS[8] * b))**3,
                alpha,
                missing_lightness:,
                missing_chroma:,
                missing_hue:,
                missing_a:,
                missing_b:
              )
            end
          end
        end

        private_constant :Oklab

        OKLAB = Oklab.new
      end
    end
  end
end
