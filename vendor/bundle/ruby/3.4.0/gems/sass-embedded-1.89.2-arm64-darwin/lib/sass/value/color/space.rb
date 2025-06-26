# frozen_string_literal: true

module Sass
  module Value
    class Color
      # @see https://github.com/sass/dart-sass/blob/main/lib/src/value/color/space.dart
      module Space
        # @return [::String]
        attr_reader :name

        # @return [Array<ColorChannel>]
        attr_reader :channels

        # @return [::Boolean]
        def bounded?
          raise NotImplementedError
        end

        # @return [::Boolean]
        def legacy?
          false
        end

        # @return [::Boolean]
        def polar?
          false
        end

        # @param name [::String]
        # @param channels [Array<ColorChannel>]
        def initialize(name, channels)
          @name = name
          @channels = channels
        end

        class << self
          # @param name [::String]
          # @param argument_name [::String]
          # @return [Space]
          def from_name(name, argument_name = nil)
            case name.downcase
            when 'rgb'
              RGB
            when 'hwb'
              HWB
            when 'hsl'
              HSL
            when 'srgb'
              SRGB
            when 'srgb-linear'
              SRGB_LINEAR
            when 'display-p3'
              DISPLAY_P3
            when 'a98-rgb'
              A98_RGB
            when 'prophoto-rgb'
              PROPHOTO_RGB
            when 'rec2020'
              REC2020
            when 'xyz', 'xyz-d65'
              XYZ_D65
            when 'xyz-d50'
              XYZ_D50
            when 'lab'
              LAB
            when 'lch'
              LCH
            when 'oklab'
              OKLAB
            when 'oklch'
              OKLCH
            else
              raise Sass::ScriptError.new("Unknown color space \"#{name}\".", argument_name)
            end
          end
        end

        # @param dest [Space]
        # @param channel0 [Numeric]
        # @param channel1 [Numeric]
        # @param channel2 [Numeric]
        # @param alpha [Numeric]
        # @return [Color]
        def convert(dest, channel0, channel1, channel2, alpha)
          convert_linear(dest, channel0, channel1, channel2, alpha)
        end

        protected

        def convert_linear(dest, red, green, blue, alpha,
                           missing_lightness: false,
                           missing_chroma: false,
                           missing_hue: false,
                           missing_a: false,
                           missing_b: false)
          linear_dest = case dest
                        when HSL, HWB
                          SRGB
                        when LAB, LCH
                          XYZ_D50
                        when OKLAB, OKLCH
                          LMS
                        else
                          dest
                        end
          if linear_dest == self
            transformed_red = red
            transformed_green = green
            transformed_blue = blue
          else
            linear_red = to_linear(red.nil? ? 0 : red)
            linear_green = to_linear(green.nil? ? 0 : green)
            linear_blue = to_linear(blue.nil? ? 0 : blue)
            matrix = transformation_matrix(linear_dest)

            # (matrix * [linear_red, linear_green, linear_blue]).map(linear_dest.from_linear)
            transformed_red = linear_dest.from_linear((matrix[0] * linear_red) +
                                                      (matrix[1] * linear_green) +
                                                      (matrix[2] * linear_blue))
            transformed_green = linear_dest.from_linear((matrix[3] * linear_red) +
                                                        (matrix[4] * linear_green) +
                                                        (matrix[5] * linear_blue))
            transformed_blue = linear_dest.from_linear((matrix[6] * linear_red) +
                                                       (matrix[7] * linear_green) +
                                                       (matrix[8] * linear_blue))
          end

          case dest
          when HSL, HWB
            SRGB.convert(dest, transformed_red, transformed_green, transformed_blue, alpha,
                         missing_lightness:,
                         missing_chroma:,
                         missing_hue:)
          when LAB, LCH
            XYZ_D50.convert(dest, transformed_red, transformed_green, transformed_blue, alpha,
                            missing_lightness:,
                            missing_chroma:,
                            missing_hue:,
                            missing_a:,
                            missing_b:)
          when OKLAB, OKLCH
            LMS.convert(dest, transformed_red, transformed_green, transformed_blue, alpha,
                        missing_lightness:,
                        missing_chroma:,
                        missing_hue:,
                        missing_a:,
                        missing_b:)
          else
            Color.send(:_for_space,
                       dest,
                       red.nil? ? nil : transformed_red,
                       green.nil? ? nil : transformed_green,
                       blue.nil? ? nil : transformed_blue,
                       alpha)
          end
        end

        # @param channel [Numeric]
        # @return [Numeric]
        def to_linear(channel)
          raise NotImplementedError, "[BUG] Color space #{name} doesn't support linear conversions."
        end

        # @param channel [Numeric]
        # @return [Numeric]
        def from_linear(channel)
          raise NotImplementedError, "[BUG] Color space #{name} doesn't support linear conversions."
        end

        # @param dest [Space]
        # @return [Array<Numeric>]
        def transformation_matrix(dest)
          raise NotImplementedError, "[BUG] Color space conversion from #{name} to #{dest.name} not implemented."
        end
      end

      private_constant :Space
    end
  end
end

require_relative 'space/utils'
require_relative 'space/a98_rgb'
require_relative 'space/display_p3'
require_relative 'space/hsl'
require_relative 'space/hwb'
require_relative 'space/lab'
require_relative 'space/lch'
require_relative 'space/lms'
require_relative 'space/oklab'
require_relative 'space/oklch'
require_relative 'space/prophoto_rgb'
require_relative 'space/rec2020'
require_relative 'space/rgb'
require_relative 'space/srgb'
require_relative 'space/srgb_linear'
require_relative 'space/xyz_d50'
require_relative 'space/xyz_d65'
