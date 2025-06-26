# frozen_string_literal: true

require_relative 'color/channel'
require_relative 'color/conversions'
require_relative 'color/gamut_map_method'
require_relative 'color/interpolation_method'
require_relative 'color/space'

module Sass
  module Value
    # Sass's color type.
    #
    # No matter what representation was originally used to create this color, all of its channels are accessible.
    #
    # @see https://sass-lang.com/documentation/js-api/classes/sasscolor/
    class Color
      include Value

      # @param red [Numeric]
      # @param green [Numeric]
      # @param blue [Numeric]
      # @param hue [Numeric]
      # @param saturation [Numeric]
      # @param lightness [Numeric]
      # @param whiteness [Numeric]
      # @param blackness [Numeric]
      # @param a [Numeric]
      # @param b [Numeric]
      # @param chroma [Numeric]
      # @param x [Numeric]
      # @param y [Numeric]
      # @param z [Numeric]
      # @param alpha [Numeric]
      # @param space [::String]
      # @overload initialize(red: nil, green: nil, blue: nil, alpha: nil, space: 'rgb')
      # @overload initialize(hue: nil, saturation: nil, lightness: nil, alpha: nil, space: 'hsl')
      # @overload initialize(hue: nil, whiteness: nil, blackness: nil, alpha: nil, space: 'hwb')
      # @overload initialize(lightness: nil, a: nil, b: nil, alpha: nil, space: 'lab')
      # @overload initialize(lightness: nil, a: nil, b: nil, alpha: nil, space: 'oklab')
      # @overload initialize(lightness: nil, chroma: nil, hue: nil, alpha: nil, space: 'lch')
      # @overload initialize(lightness: nil, chroma: nil, hue: nil, alpha: nil, space: 'oklch')
      # @overload initialize(red: nil, green: nil, blue: nil, alpha: nil, space: 'a98-rgb')
      # @overload initialize(red: nil, green: nil, blue: nil, alpha: nil, space: 'display-p3')
      # @overload initialize(red: nil, green: nil, blue: nil, alpha: nil, space: 'prophoto-rgb')
      # @overload initialize(red: nil, green: nil, blue: nil, alpha: nil, space: 'rec2020')
      # @overload initialize(red: nil, green: nil, blue: nil, alpha: nil, space: 'srgb')
      # @overload initialize(red: nil, green: nil, blue: nil, alpha: nil, space: 'srgb-linear')
      # @overload initialize(x: nil, y: nil, z: nil, alpha: nil, space: 'xyz')
      # @overload initialize(x: nil, y: nil, z: nil, alpha: nil, space: 'xyz-d50')
      # @overload initialize(x: nil, y: nil, z: nil, alpha: nil, space: 'xyz-d65')
      def initialize(**options)
        unless options.key?(:space)
          options[:space] = case options
                            in { red: _, green: _, blue: _ }
                              'rgb'
                            in { hue: _, saturation: _, lightness: _ }
                              'hsl'
                            in { hue: _, whiteness: _, blackness: _ }
                              'hwb'
                            else
                              raise Sass::ScriptError.new('No color space found', 'space')
                            end
        end

        space = Space.from_name(options[:space])

        keys = _assert_options(space, options)

        _initialize_for_space_internal(space,
                                       options[keys[0]],
                                       options[keys[1]],
                                       options[keys[2]],
                                       options.fetch(:alpha, 1))
      end

      # @return [::String]
      def space
        _space.name
      end

      # @param space [::String]
      # @return [Color]
      def to_space(space)
        _to_space(Space.from_name(space))
      end

      # @param space [::String]
      # @return [::Boolean]
      def in_gamut?(space = nil)
        return to_space(space)._in_gamut? unless space.nil?

        _in_gamut?
      end

      # @param method [::String]
      # @param space [::String]
      # @return [Color]
      def to_gamut(method:, space: nil)
        return to_space(space).to_gamut(method:)._to_space(_space) unless space.nil?

        _to_gamut(GamutMapMethod.from_name(method, 'method'))
      end

      # @return [Array<Numeric, nil>]
      def channels_or_nil
        [channel0_or_nil, channel1_or_nil, channel2_or_nil].freeze
      end

      # @return [Array<Numeric>]
      def channels
        [channel0, channel1, channel2].freeze
      end

      # @param channel [::String]
      # @param space [::String]
      # @return [Numeric]
      def channel(channel, space: nil)
        return to_space(space).channel(channel) unless space.nil?

        channels = _space.channels
        return channel0 if channel == channels[0].name
        return channel1 if channel == channels[1].name
        return channel2 if channel == channels[2].name
        return alpha if channel == 'alpha'

        raise Sass::ScriptError.new("Color #{self} doesn't have a channel named \"#{channel}\".", channel)
      end

      # @param channel [::String]
      # @return [::Boolean]
      def channel_missing?(channel)
        channels = _space.channels
        return channel0_missing? if channel == channels[0].name
        return channel1_missing? if channel == channels[1].name
        return channel2_missing? if channel == channels[2].name
        return alpha_missing? if channel == 'alpha'

        raise Sass::ScriptError.new("Color #{self} doesn't have a channel named \"#{channel}\".", channel)
      end

      # @param channel [::String]
      # @param space [::String]
      # @return [::Boolean]
      def channel_powerless?(channel, space: nil)
        return to_space(space).channel_powerless?(channel) unless space.nil?

        channels = _space.channels
        return channel0_powerless? if channel == channels[0].name
        return channel1_powerless? if channel == channels[1].name
        return channel2_powerless? if channel == channels[2].name
        return false if channel == 'alpha'

        raise Sass::ScriptError.new("Color #{self} doesn't have a channel named \"#{channel}\".", channel)
      end

      # @param other [Color]
      # @param method [::String]
      # @param weight [Numeric]
      # @return [Color]
      def interpolate(other, method: nil, weight: nil)
        interpolation_method = if !method.nil?
                                 InterpolationMethod.new(_space, HueInterpolationMethod.from_name(method))
                               elsif !_space.polar?
                                 InterpolationMethod.new(_space)
                               else
                                 InterpolationMethod.new(_space, :shorter)
                               end
        _interpolate(other, interpolation_method, weight:)
      end

      # @param red [Numeric]
      # @param green [Numeric]
      # @param blue [Numeric]
      # @param hue [Numeric]
      # @param saturation [Numeric]
      # @param lightness [Numeric]
      # @param whiteness [Numeric]
      # @param blackness [Numeric]
      # @param a [Numeric]
      # @param b [Numeric]
      # @param chroma [Numeric]
      # @param x [Numeric]
      # @param y [Numeric]
      # @param z [Numeric]
      # @param alpha [Numeric]
      # @param space [::String]
      # @overload change(red: nil, green: nil, blue: nil, alpha: nil, space: 'rgb')
      # @overload change(hue: nil, saturation: nil, lightness: nil, alpha: nil, space: 'hsl')
      # @overload change(hue: nil, whiteness: nil, blackness: nil, alpha: nil, space: 'hwb')
      # @overload change(lightness: nil, a: nil, b: nil, alpha: nil, space: 'lab')
      # @overload change(lightness: nil, a: nil, b: nil, alpha: nil, space: 'oklab')
      # @overload change(lightness: nil, chroma: nil, hue: nil, alpha: nil, space: 'lch')
      # @overload change(lightness: nil, chroma: nil, hue: nil, alpha: nil, space: 'oklch')
      # @overload change(red: nil, green: nil, blue: nil, alpha: nil, space: 'a98-rgb')
      # @overload change(red: nil, green: nil, blue: nil, alpha: nil, space: 'display-p3')
      # @overload change(red: nil, green: nil, blue: nil, alpha: nil, space: 'prophoto-rgb')
      # @overload change(red: nil, green: nil, blue: nil, alpha: nil, space: 'rec2020')
      # @overload change(red: nil, green: nil, blue: nil, alpha: nil, space: 'srgb')
      # @overload change(red: nil, green: nil, blue: nil, alpha: nil, space: 'srgb-linear')
      # @overload change(x: nil, y: nil, z: nil, alpha: nil, space: 'xyz')
      # @overload change(x: nil, y: nil, z: nil, alpha: nil, space: 'xyz-d50')
      # @overload change(x: nil, y: nil, z: nil, alpha: nil, space: 'xyz-d65')
      # @return [Color]
      def change(**options)
        space_set_explictly = !options[:space].nil?
        space = space_set_explictly ? Space.from_name(options[:space]) : _space

        if legacy? && !space_set_explictly
          case options
          in { whiteness: _ } | { blackness: _ }
            space = Space::HWB
          in { saturation: _ } | { lightness: _ }
            space = Space::HSL
          in { hue: _ }
            space = if _space == Space::HWB
                      Space::HWB
                    else
                      Space::HSL
                    end
          in { red: _ } | { blue: _ } | { green: _ }
            space = Space::RGB
          else
          end

          if space != _space
            # deprecated
          end
        end

        keys = _assert_options(space, options)

        color = _to_space(space)

        changed_color = if space_set_explictly
                          Color.send(:for_space_internal,
                                     space,
                                     options.fetch(keys[0], color.channel0_or_nil),
                                     options.fetch(keys[1], color.channel1_or_nil),
                                     options.fetch(keys[2], color.channel2_or_nil),
                                     options.fetch(:alpha, color.alpha_or_nil))
                        else
                          changed_channel0_or_nil = options[keys[0]]
                          changed_channel1_or_nil = options[keys[1]]
                          changed_channel2_or_nil = options[keys[2]]
                          changed_alpha_or_nil = options[:alpha]
                          Color.send(:for_space_internal,
                                     space,
                                     changed_channel0_or_nil.nil? ? color.channel0_or_nil : changed_channel0_or_nil,
                                     changed_channel1_or_nil.nil? ? color.channel1_or_nil : changed_channel1_or_nil,
                                     changed_channel2_or_nil.nil? ? color.channel2_or_nil : changed_channel2_or_nil,
                                     changed_alpha_or_nil.nil? ? color.alpha_or_nil : changed_alpha_or_nil)
                        end

        changed_color._to_space(_space)
      end

      # @return [Numeric]
      def alpha
        @alpha_or_nil.nil? ? 0 : @alpha_or_nil
      end

      # @return [::Boolean]
      def legacy?
        _space.legacy?
      end

      # @deprecated
      # @return [Numeric]
      def red
        _to_space(Space::RGB).channel('red').round
      end

      # @deprecated
      # @return [Numeric]
      def green
        _to_space(Space::RGB).channel('green').round
      end

      # @deprecated
      # @return [Numeric]
      def blue
        _to_space(Space::RGB).channel('blue').round
      end

      # @deprecated
      # @return [Numeric]
      def hue
        _to_space(Space::HSL).channel('hue')
      end

      # @deprecated
      # @return [Numeric]
      def saturation
        _to_space(Space::HSL).channel('saturation')
      end

      # @deprecated
      # @return [Numeric]
      def lightness
        _to_space(Space::HSL).channel('lightness')
      end

      # @deprecated
      # @return [Numeric]
      def whiteness
        _to_space(Space::HWB).channel('whiteness')
      end

      # @deprecated
      # @return [Numeric]
      def blackness
        _to_space(Space::HWB).channel('blackness')
      end

      # @return [::Boolean]
      def ==(other)
        return false unless other.is_a?(Sass::Value::Color)

        if legacy?
          return false unless other.legacy?
          return false unless FuzzyMath.equals_nilable?(other.alpha_or_nil, alpha_or_nil)

          if _space == other._space
            FuzzyMath.equals_nilable?(other.channel0_or_nil, channel0_or_nil) &&
              FuzzyMath.equals_nilable?(other.channel1_or_nil, channel1_or_nil) &&
              FuzzyMath.equals_nilable?(other.channel2_or_nil, channel2_or_nil)
          else
            _to_space(Space::RGB) == other._to_space(Space::RGB)
          end
        else
          other._space == _space &&
            FuzzyMath.equals_nilable?(other.channel0_or_nil, channel0_or_nil) &&
            FuzzyMath.equals_nilable?(other.channel1_or_nil, channel1_or_nil) &&
            FuzzyMath.equals_nilable?(other.channel2_or_nil, channel2_or_nil) &&
            FuzzyMath.equals_nilable?(other.alpha_or_nil, alpha_or_nil)
        end
      end

      # @return [Integer]
      def hash
        @hash ||= [
          _space.name,
          FuzzyMath._hash(channel0_or_nil),
          FuzzyMath._hash(channel1_or_nil),
          FuzzyMath._hash(channel2_or_nil),
          FuzzyMath._hash(alpha_or_nil)
        ].hash
      end

      # @return [Color]
      def assert_color(_name = nil)
        self
      end

      protected

      attr_reader :channel0_or_nil, :channel1_or_nil, :channel2_or_nil, :alpha_or_nil

      def channel0
        @channel0_or_nil.nil? ? 0 : @channel0_or_nil
      end

      def channel0_missing?
        @channel0_or_nil.nil?
      end

      def channel0_powerless?
        case _space
        when Space::HSL
          FuzzyMath.equals?(channel1, 0)
        when Space::HWB
          FuzzyMath.greater_than_or_equals?(channel1 + channel2, 100)
        else
          false
        end
      end

      def channel1
        @channel1_or_nil.nil? ? 0 : @channel1_or_nil
      end

      def channel1_missing?
        @channel1_or_nil.nil?
      end

      def channel1_powerless?
        false
      end

      def channel2
        @channel2_or_nil.nil? ? 0 : @channel2_or_nil
      end

      def channel2_missing?
        @channel2_or_nil.nil?
      end

      def channel2_powerless?
        case _space
        when Space::LCH, Space::OKLCH
          FuzzyMath.equals?(channel1, 0)
        else
          false
        end
      end

      def alpha_missing?
        @alpha_or_nil.nil?
      end

      def _space
        @space
      end

      def _to_space(space)
        return self if _space == space

        _space.convert(space, channel0_or_nil, channel1_or_nil, channel2_or_nil, alpha)
      end

      def _in_gamut?
        return true unless _space.bounded?

        _is_channel_in_gamut(channel0, _space.channels[0]) &&
          _is_channel_in_gamut(channel1, _space.channels[1]) &&
          _is_channel_in_gamut(channel2, _space.channels[2])
      end

      def _to_gamut(method)
        _in_gamut? ? self : method.map(self)
      end

      private

      def _assert_options(space, options)
        keys = space.channels.map do |channel|
          channel.name.to_sym
        end << :alpha << :space
        options.each_key do |key|
          unless keys.include?(key)
            raise Sass::ScriptError.new("`#{key}` is not a valid channel in `#{space.name}`.", key)
          end
        end
        keys
      end

      def _initialize_for_space_internal(space, channel0, channel1, channel2, alpha = 1)
        case space
        when Space::HSL
          _initialize_for_space(
            space,
            _normalize_hue(channel0, invert: !channel1.nil? && FuzzyMath.less_than?(channel1, 0)),
            channel1&.abs,
            channel2,
            alpha
          )
        when Space::HWB
          _initialize_for_space(space, _normalize_hue(channel0, invert: false), channel1, channel2, alpha)
        when Space::LCH, Space::OKLCH
          _initialize_for_space(
            space,
            channel0,
            channel1&.abs,
            _normalize_hue(channel2, invert: !channel1.nil? && FuzzyMath.less_than?(channel1, 0)),
            alpha
          )
        else
          _initialize_for_space(space, channel0, channel1, channel2, alpha)
        end
      end

      def _initialize_for_space(space, channel0_or_nil, channel1_or_nil, channel2_or_nil, alpha)
        @space = space
        @channel0_or_nil = channel0_or_nil
        @channel1_or_nil = channel1_or_nil
        @channel2_or_nil = channel2_or_nil
        @alpha_or_nil = alpha

        FuzzyMath.assert_between(@alpha_or_nil, 0, 1, 'alpha') unless @alpha_or_nil.nil?
      end

      def _normalize_hue(hue, invert:)
        return hue if hue.nil?

        ((hue % 360) + 360 + (invert ? 180 : 0)) % 360
      end

      def _is_channel_in_gamut(value, channel)
        case channel
        when LinearChannel
          FuzzyMath.less_than_or_equals?(value, channel.max) && FuzzyMath.greater_than_or_equals?(value, channel.min)
        else
          true
        end
      end

      def _interpolate(other, method, weight: nil)
        weight = 0.5 if weight.nil?
        if weight.negative? || weight > 1
          raise Sass::ScriptError.new("Expected #{wieght} to be within 0 and 1.", 'weight')
        end

        return other if FuzzyMath.equals?(weight, 0)
        return self if FuzzyMath.equals?(weight, 1)

        color1 = _to_space(method.space)
        color2 = other._to_space(method.space)

        c1_missing0 = _analogous_channel_missing?(self, color1, 0)
        c1_missing1 = _analogous_channel_missing?(self, color1, 1)
        c1_missing2 = _analogous_channel_missing?(self, color1, 2)
        c2_missing0 = _analogous_channel_missing?(other, color2, 0)
        c2_missing1 = _analogous_channel_missing?(other, color2, 1)
        c2_missing2 = _analogous_channel_missing?(other, color2, 2)
        c1_channel0 = (c1_missing0 ? color2 : color1).channel0
        c1_channel1 = (c1_missing1 ? color2 : color1).channel1
        c1_channel2 = (c1_missing2 ? color2 : color1).channel2
        c2_channel0 = (c2_missing0 ? color1 : color2).channel0
        c2_channel1 = (c2_missing1 ? color1 : color2).channel1
        c2_channel2 = (c2_missing2 ? color1 : color2).channel2
        c1_alpha = alpha_or_nil.nil? ? other.alpha : alpha_or_nil
        c2_alpha = other.alpha_or_nil.nil? ? alpha : other.alpha_or_nil

        c1_multiplier = (alpha_or_nil.nil? ? 1 : alpha_or_nil) * weight
        c2_multiplier = (other.alpha_or_nil.nil? ? 1 : other.alpha_or_nil) * (1 - weight)
        mixed_alpha = alpha_missing? && other.alpha_missing? ? nil : (c1_alpha * weight) + (c2_alpha * (1 - weight))
        mixed0 = if c1_missing0 && c2_missing0
                   nil
                 else
                   ((c1_channel0 * c1_multiplier) + (c2_channel0 * c2_multiplier)) /
                     (mixed_alpha.nil? ? 1 : mixed_alpha)
                 end
        mixed1 = if c1_missing1 && c2_missing1
                   nil
                 else
                   ((c1_channel1 * c1_multiplier) + (c2_channel1 * c2_multiplier)) /
                     (mixed_alpha.nil? ? 1 : mixed_alpha)
                 end
        mixed2 = if c1_missing2 && c2_missing2
                   nil
                 else
                   ((c1_channel2 * c1_multiplier) + (c2_channel2 * c2_multiplier)) /
                     (mixed_alpha.nil? ? 1 : mixed_alpha)
                 end

        case method.space
        when Space::HSL, Space::HWB
          Color.send(:for_space_internal,
                     method.space,
                     c1_missing0 && c2_missing0 ? nil : _interpolate_hues(c1_channel0, c2_channel0, method.hue, weight),
                     mixed1,
                     mixed2,
                     mixed_alpha)
        when Space::LCH, Space::OKLCH
          Color.send(:for_space_internal,
                     method.space,
                     mixed0,
                     mixed1,
                     c1_missing2 && c2_missing2 ? nil : _interpolate_hues(c1_channel2, c2_channel2, method.hue, weight),
                     mixed_alpha)
        else
          Color.send(:_for_space,
                     method.space, mixed0, mixed1, mixed2, mixed_alpha)
        end._to_space(_space)
      end

      def _analogous_channel_missing?(original, output, output_channel_index)
        return true if output.channels_or_nil[output_channel_index].nil?

        return false if original.equal?(output)

        output_channel = output._space.channels[output_channel_index]
        original_channel = original._space.channels.find do |channel|
          output_channel.analogous?(channel)
        end

        return false if original_channel.nil?

        original.channel_missing?(original_channel.name)
      end

      def _interpolate_hues(hue1, hue2, method, weight)
        case method
        when :shorter
          diff = hue2 - hue1
          if diff > 180
            hue1 += 360
          elsif diff < -180
            hue2 += 360
          end
        when :longer
          diff = hue2 - hue1
          if diff.positive? && diff < 180
            hue2 += 360
          elsif diff > -180 && diff <= 0
            hue1 += 360
          end
        when :increasing
          hue2 += 360 if hue2 < hue1
        when :decreasing
          hue1 += 360 if hue1 < hue2
        end

        (hue1 * weight) + (hue2 * (1 - weight))
      end

      class << self
        private

        def for_space(space, channel0_or_nil, channel1_or_nil, channel2_or_nil, alpha)
          _for_space(Space.from_name(space), channel0_or_nil, channel1_or_nil, channel2_or_nil, alpha)
        end

        def for_space_internal(space, channel0, channel1, channel2, alpha)
          o = allocate
          o.send(:_initialize_for_space_internal, space, channel0, channel1, channel2, alpha)
          o
        end

        def _for_space(space, channel0_or_nil, channel1_or_nil, channel2_or_nil, alpha)
          o = allocate
          o.send(:_initialize_for_space, space, channel0_or_nil, channel1_or_nil, channel2_or_nil, alpha)
          o
        end
      end
    end
  end
end
