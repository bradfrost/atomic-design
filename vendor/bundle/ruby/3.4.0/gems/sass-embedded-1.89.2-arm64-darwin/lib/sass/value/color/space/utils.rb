# frozen_string_literal: true

module Sass
  module Value
    class Color
      module Space
        # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space/utils.dart
        module Utils
          module_function

          # A constant used to convert Lab to/from XYZ.
          LAB_KAPPA = Rational(24_389, 27) # 29^3/3^3

          # A constant used to convert Lab to/from XYZ.
          LAB_EPSILON = Rational(216, 24_389) # 6^3/29^3

          # The hue channel shared across all polar color spaces.
          HUE_CHANNEL = ColorChannel.new('hue', polar_angle: true, associated_unit: 'deg').freeze

          # The color channels shared across all RGB color spaces (except the legacy RGB space).
          RGB_CHANNELS = [
            LinearChannel.new('red', 0, 1).freeze,
            LinearChannel.new('green', 0, 1).freeze,
            LinearChannel.new('blue', 0, 1).freeze
          ].freeze

          # The color channels shared across both XYZ color spaces.
          XYZ_CHANNELS = [
            LinearChannel.new('x', 0, 1).freeze,
            LinearChannel.new('y', 0, 1).freeze,
            LinearChannel.new('z', 0, 1).freeze
          ].freeze

          # The algorithm for converting a single `srgb` or `display-p3` channel to
          # linear-light form.
          # @param [Numeric]
          # @return [Numeric]
          def srgb_and_display_p3_to_linear(channel)
            abs = channel.abs
            abs <= 0.04045 ? channel / 12.92 : (channel <=> 0) * (((abs + 0.055) / 1.055)**2.4)
          end

          # The algorithm for converting a single `srgb` or `display-p3` channel to
          # gamma-corrected form.
          # @param [Numeric]
          # @return [Numeric]
          def srgb_and_display_p3_from_linear(channel)
            abs = channel.abs
            abs <= 0.0031308 ? channel * 12.92 : (channel <=> 0) * ((1.055 * (abs**(1 / 2.4))) - 0.055)
          end

          # Converts a Lab or OKLab color to LCH or OKLCH, respectively.
          #
          # The [missing_chroma] and [missing_hue] arguments indicate whether this came
          # from a color that was missing its chroma or hue channels, respectively.
          # @param dest [Space]
          # @param lightness [Numeric]
          # @param a [Numeric]
          # @param b [Numeric]
          # @param alpha [Numeric]
          # @return [Color]
          def lab_to_lch(dest, lightness, a, b, alpha, # rubocop:disable Naming/MethodParameterName
                         missing_chroma: false, missing_hue: false)
            chroma = Math.sqrt(((a.nil? ? 0 : a)**2) + ((b.nil? ? 0 : b)**2))
            hue = if missing_hue || FuzzyMath.equals?(chroma, 0)
                    nil
                  else
                    Math.atan2(b.nil? ? 0 : b, a.nil? ? 0 : a) * 180 / Math::PI
                  end

            Color.send(
              :for_space_internal,
              dest,
              lightness,
              missing_chroma ? nil : chroma,
              hue.nil? || hue >= 0 ? hue : hue + 360,
              alpha
            )
          end
        end

        private_constant :Utils
      end
    end
  end
end
