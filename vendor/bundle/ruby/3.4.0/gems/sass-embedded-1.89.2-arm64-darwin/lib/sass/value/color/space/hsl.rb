# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/hsl.dart
        class Hsl
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
            super('hsl', [
              Utils::HUE_CHANNEL,
              LinearChannel.new('saturation', 0, 100, requires_percent: true, lower_clamped: true).freeze,
              LinearChannel.new('lightness', 0, 100, requires_percent: true).freeze
            ].freeze)
          end

          def convert(dest, hue, saturation, lightness, alpha)
            missing_lightness = lightness.nil?
            missing_chroma = saturation.nil?
            missing_hue = hue.nil?

            hue = ((hue.nil? ? 0 : hue) % 360) / 30.0
            saturation = (saturation.nil? ? 0 : saturation) / 100.0
            lightness = (lightness.nil? ? 0 : lightness) / 100.0

            a = saturation * [lightness, 1 - lightness].min
            f = lambda do |n|
              k = (n + hue) % 12
              lightness - (a * [-1, [k - 3, 9 - k, 1].min].max)
            end

            SRGB.convert(
              dest,
              f.call(0),
              f.call(8),
              f.call(4),
              alpha,
              missing_lightness:,
              missing_chroma:,
              missing_hue:
            )
          end
        end

        private_constant :Hsl

        HSL = Hsl.new
      end
    end
  end
end
