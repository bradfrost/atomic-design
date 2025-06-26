# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/hwb.dart
        class Hwb
          include Space

          def bounded?
            true
          end

          def legacy?
            true
          end

          def polar?
            true
          end

          def initialize
            super('hwb', [
              Utils::HUE_CHANNEL,
              LinearChannel.new('whiteness', 0, 100, requires_percent: true).freeze,
              LinearChannel.new('blackness', 0, 100, requires_percent: true).freeze
            ].freeze)
          end

          def convert(dest, hue, whiteness, blackness, alpha)
            missing_hue = hue.nil?

            hue = ((hue.nil? ? 0 : hue) % 360) / 30.0
            whiteness = (whiteness.nil? ? 0 : whiteness) / 100.0
            blackness = (blackness.nil? ? 0 : blackness) / 100.0

            sum = whiteness + blackness
            if sum > 1
              gray = whiteness / sum
              SRGB.convert(dest,
                           gray,
                           gray,
                           gray,
                           alpha,
                           missing_hue:)
            else
              f = lambda do |n|
                k = (n + hue) % 12
                0.5 - ([-1, [k - 3, 9 - k, 1].min].max / 2.0)
              end

              factor = 1 - sum
              SRGB.convert(dest,
                           (f.call(0) * factor) + whiteness,
                           (f.call(8) * factor) + whiteness,
                           (f.call(4) * factor) + whiteness,
                           alpha,
                           missing_hue:)
            end
          end
        end

        private_constant :Hwb

        HWB = Hwb.new
      end
    end
  end
end
