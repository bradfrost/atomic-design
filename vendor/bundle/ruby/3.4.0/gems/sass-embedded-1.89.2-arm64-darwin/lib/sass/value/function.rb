# frozen_string_literal: true

module Sass
  module Value
    # Sass's function type.
    #
    # @see https://sass-lang.com/documentation/js-api/classes/sassfunction/
    class Function
      include Value

      # @param signature [::String]
      # @param callback [Proc]
      def initialize(signature, &callback)
        @signature = signature.freeze
        @callback = callback.freeze
      end

      # @return [Object, nil]
      protected attr_reader :compile_context

      # @return [Integer, nil]
      protected attr_reader :id

      # @return [::String, nil]
      attr_reader :signature

      # @return [Proc, nil]
      attr_reader :callback

      # @return [::Boolean]
      def ==(other)
        return false unless other.is_a?(Sass::Value::Function)

        if defined?(@id)
          other.compile_context == compile_context && other.id == id
        else
          other.signature == signature && other.callback == callback
        end
      end

      # @return [Integer]
      def hash
        @hash ||= defined?(@id) ? [compile_context, id].hash : [signature, callback].hash
      end

      # @return [Function]
      def assert_function(_name = nil)
        self
      end
    end
  end
end
