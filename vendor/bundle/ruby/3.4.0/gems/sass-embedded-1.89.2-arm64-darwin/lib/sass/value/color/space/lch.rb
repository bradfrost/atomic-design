# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/lch.dart
        class Lch
          include Space

          def bounded?
            false
          end

          def polar?
            true
          end

          def initialize
            super('lch', [
              LinearChannel.new('lightness', 0, 100, lower_clamped: true, upper_clamped: true).freeze,
              LinearChannel.new('chroma', 0, 150, lower_clamped: true).freeze,
              Utils::HUE_CHANNEL
            ].freeze)
          end

          def convert(dest, lightness, chroma, hue, alpha)
            missing_chroma = chroma.nil?
            missing_hue = hue.nil?

            chroma = 0 if missing_chroma
            hue = 0 if missing_hue

            hue_radians = hue * Math::PI / 180
            LAB.convert(
              dest,
              lightness,
              chroma * Math.cos(hue_radians),
              chroma * Math.sin(hue_radians),
              alpha,
              missing_chroma:,
              missing_hue:
            )
          end
        end

        private_constant :Lch

        LCH = Lch.new
      end
    end
  end
end
