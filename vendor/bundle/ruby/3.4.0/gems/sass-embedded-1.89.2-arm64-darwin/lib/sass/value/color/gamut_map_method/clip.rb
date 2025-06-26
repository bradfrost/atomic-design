# frozen_string_literal: true

module Sass
  module Value
    class Color
      module GamutMapMethod
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/gamut_map_method/local_minde.dart
        class Clip
          include GamutMapMethod

          def initialize
            super('clip')
          end

          def map(color)
            space = color.send(:_space)
            Color.send(:for_space_internal,
                       space,
                       _clamp_channel(color.send(:channel0_or_nil), space.channels[0]),
                       _clamp_channel(color.send(:channel1_or_nil), space.channels[1]),
                       _clamp_channel(color.send(:channel2_or_nil), space.channels[2]),
                       color.send(:alpha_or_nil))
          end

          private

          def _clamp_channel(value, channel)
            return nil if value.nil?

            case channel
            when LinearChannel
              FuzzyMath._clamp_like_css(value, channel.min, channel.max)
            else
              value
            end
          end
        end

        private_constant :Clip

        CLIP = Clip.new
      end
    end
  end
end
