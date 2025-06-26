# frozen_string_literal: true

module Sass
  module Value
    class Color
      module GamutMapMethod
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/gamut_map_method/local_minde.dart
        class LocalMinde
          include GamutMapMethod

          # A constant from the gamut-mapping algorithm.
          JND = 0.02

          private_constant :JND

          # A constant from the gamut-mapping algorithm.
          EPSILON = 0.0001

          private_constant :EPSILON

          def initialize
            super('local-minde')
          end

          def map(color)
            original_oklch = color.send(:_to_space, Space::OKLCH)
            lightness = original_oklch.send(:channel0_or_nil)
            hue = original_oklch.send(:channel2_or_nil)
            alpha = original_oklch.send(:alpha_or_nil)

            if FuzzyMath.greater_than_or_equals?(lightness.nil? ? 0 : lightness, 1)
              if color.legacy?
                return Color.send(:_for_space,
                                  Space::RGB, 255, 255, 255, color.send(:alpha_or_nil))
                            .send(:_to_space, color.send(:_space))
              else
                return Color.send(:for_space_internal,
                                  color.send(:_space), 1, 1, 1, color.send(:alpha_or_nil))
              end
            elsif FuzzyMath.less_than_or_equals?(lightness.nil? ? 0 : lightness, 0)
              return Color.send(:_for_space,
                                Space::RGB, 0, 0, 0, color.send(:alpha_or_nil))
                          .send(:_to_space, color.send(:_space))
            end

            clipped = color.send(:_to_gamut, CLIP)
            return clipped if _delta_eok(clipped, color) < JND

            min = 0.0
            max = original_oklch.send(:channel1)
            min_in_gamut = true
            while max - min > EPSILON
              chroma = (min + max) / 2

              current = Space::OKLCH.convert(color.send(:_space), lightness, chroma, hue, alpha)

              if min_in_gamut && current.in_gamut?
                min = chroma
                next
              end

              clipped = current.send(:_to_gamut, CLIP)
              e = _delta_eok(clipped, current)

              if e < JND
                return clipped if JND - e < EPSILON

                min_in_gamut = false
                min = chroma
              else
                max = chroma
              end
            end
            clipped
          end

          private

          def _delta_eok(color1, color2)
            lab1 = color1.send(:_to_space, Space::OKLAB)
            lab2 = color2.send(:_to_space, Space::OKLAB)
            Math.sqrt(((lab1.send(:channel0) - lab2.send(:channel0))**2) +
                        ((lab1.send(:channel1) - lab2.send(:channel1))**2) +
                        ((lab1.send(:channel2) - lab2.send(:channel2))**2))
          end
        end

        private_constant :LocalMinde

        LOCAL_MINDE = LocalMinde.new
      end
    end
  end
end
