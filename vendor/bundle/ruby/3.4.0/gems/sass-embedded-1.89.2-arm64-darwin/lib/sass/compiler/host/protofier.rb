# frozen_string_literal: true

module Sass
  class Compiler
    class Host
      # The {Protofier} class.
      #
      # It converts Pure Ruby types and Protobuf Ruby types.
      class Protofier
        def initialize(function_registry)
          @function_registry = function_registry
        end

        def to_proto(obj)
          case obj
          when Sass::Value::String
            EmbeddedProtocol::Value.new(
              string: EmbeddedProtocol::Value::String.new(
                text: obj.text.to_str,
                quoted: obj.quoted?
              )
            )
          when Sass::Value::Number
            EmbeddedProtocol::Value.new(
              number: Number.to_proto(obj)
            )
          when Sass::Value::Color
            EmbeddedProtocol::Value.new(
              color: EmbeddedProtocol::Value::Color.new(
                channel1: obj.send(:channel0_or_nil),
                channel2: obj.send(:channel1_or_nil),
                channel3: obj.send(:channel2_or_nil),
                alpha: obj.send(:alpha_or_nil),
                space: obj.space
              )
            )
          when Sass::Value::ArgumentList
            if obj.instance_variable_get(:@compile_context) == @function_registry.compile_context
              EmbeddedProtocol::Value.new(
                argument_list: EmbeddedProtocol::Value::ArgumentList.new(
                  id: obj.instance_variable_get(:@id)
                )
              )
            else
              EmbeddedProtocol::Value.new(
                argument_list: EmbeddedProtocol::Value::ArgumentList.new(
                  contents: obj.to_a.map { |element| to_proto(element) },
                  keywords: obj.keywords.each_with_object({}) { |(key, value), hash| hash[key.to_s] = to_proto(value) },
                  separator: ListSeparator.to_proto(obj.separator)
                )
              )
            end
          when Sass::Value::List
            EmbeddedProtocol::Value.new(
              list: EmbeddedProtocol::Value::List.new(
                contents: obj.to_a.map { |element| to_proto(element) },
                separator: ListSeparator.to_proto(obj.separator),
                has_brackets: obj.bracketed?
              )
            )
          when Sass::Value::Map
            EmbeddedProtocol::Value.new(
              map: EmbeddedProtocol::Value::Map.new(
                entries: obj.contents.map do |key, value|
                  EmbeddedProtocol::Value::Map::Entry.new(
                    key: to_proto(key),
                    value: to_proto(value)
                  )
                end
              )
            )
          when Sass::Value::Function
            if obj.instance_variable_defined?(:@id)
              EmbeddedProtocol::Value.new(
                compiler_function: EmbeddedProtocol::Value::CompilerFunction.new(
                  id: assert_compiler_value(obj).instance_variable_get(:@id)
                )
              )
            else
              EmbeddedProtocol::Value.new(
                host_function: EmbeddedProtocol::Value::HostFunction.new(
                  id: @function_registry.register(obj.callback),
                  signature: obj.signature
                )
              )
            end
          when Sass::Value::Mixin
            EmbeddedProtocol::Value.new(
              compiler_mixin: EmbeddedProtocol::Value::CompilerMixin.new(
                id: assert_compiler_value(obj).instance_variable_get(:@id)
              )
            )
          when Sass::Value::Calculation
            EmbeddedProtocol::Value.new(
              calculation: Calculation.to_proto(obj)
            )
          when Sass::Value::Boolean
            EmbeddedProtocol::Value.new(
              singleton: obj.value ? :TRUE : :FALSE
            )
          when Sass::Value::Null
            EmbeddedProtocol::Value.new(
              singleton: :NULL
            )
          else
            raise Sass::ScriptError, "Unknown Sass::Value #{obj}"
          end
        end

        def from_proto(proto)
          oneof = proto.value
          obj = proto.public_send(oneof)
          case oneof
          when :string
            Sass::Value::String.new(
              obj.text,
              quoted: obj.quoted
            )
          when :number
            Number.from_proto(obj)
          when :color
            Sass::Value::Color.send(
              :for_space,
              obj.space,
              obj.has_channel1? ? obj.channel1 : nil,
              obj.has_channel2? ? obj.channel2 : nil,
              obj.has_channel3? ? obj.channel3 : nil,
              obj.has_alpha? ? obj.alpha : nil
            )
          when :argument_list
            compiler_value(
              Sass::Value::ArgumentList.new(
                obj.contents.map do |element|
                  from_proto(element)
                end,
                obj.keywords.to_enum.with_object({}) do |(key, value), hash|
                  hash[key.to_sym] = from_proto(value)
                end,
                ListSeparator.from_proto(obj.separator)
              ),
              obj.id
            )
          when :list
            Sass::Value::List.new(
              obj.contents.map do |element|
                from_proto(element)
              end,
              separator: ListSeparator.from_proto(obj.separator),
              bracketed: obj.has_brackets
            )
          when :map
            Sass::Value::Map.new(
              obj.entries.to_enum.with_object({}) do |entry, hash|
                hash[from_proto(entry.key)] = from_proto(entry.value)
              end
            )
          when :compiler_function
            compiler_value(Sass::Value::Function.allocate, obj.id)
          when :host_function
            raise Sass::ScriptError, 'The compiler may not send Value.host_function to host'
          when :compiler_mixin
            compiler_value(Sass::Value::Mixin.allocate, obj.id)
          when :calculation
            Calculation.from_proto(obj)
          when :singleton
            case obj
            when :TRUE
              Sass::Value::Boolean::TRUE
            when :FALSE
              Sass::Value::Boolean::FALSE
            when :NULL
              Sass::Value::Null::NULL
            else
              raise Sass::ScriptError, "Unknown Value.singleton #{obj}"
            end
          else
            raise Sass::ScriptError, "Unknown Value.value #{obj}"
          end
        end

        private

        def assert_compiler_value(value)
          unless value.instance_variable_get(:@compile_context) == @function_registry.compile_context
            raise Sass::ScriptError, "Value #{value} does not belong to this compilation"
          end

          value
        end

        def compiler_value(value, id)
          value.instance_variable_set(:@compile_context, @function_registry.compile_context)
          value.instance_variable_set(:@id, id)
          value
        end

        # The {Number} Protofier.
        module Number
          module_function

          def to_proto(obj)
            EmbeddedProtocol::Value::Number.new(
              value: obj.value.to_f,
              numerators: obj.numerator_units,
              denominators: obj.denominator_units
            )
          end

          def from_proto(obj)
            Sass::Value::Number.new(
              obj.value, {
                numerator_units: obj.numerators.to_a,
                denominator_units: obj.denominators.to_a
              }
            )
          end
        end

        private_constant :Number

        # The {Calculation} Protofier.
        module Calculation
          module_function

          def to_proto(obj)
            EmbeddedProtocol::Value::Calculation.new(
              name: obj.name,
              arguments: obj.arguments.map { |argument| CalculationValue.to_proto(argument) }
            )
          end

          def from_proto(obj)
            Sass::Value::Calculation.send(
              :new,
              obj.name,
              obj.arguments.map { |argument| CalculationValue.from_proto(argument) }
            )
          end
        end

        private_constant :Calculation

        # The {CalculationValue} Protofier.
        module CalculationValue
          module_function

          def to_proto(value)
            case value
            when Sass::Value::Number
              EmbeddedProtocol::Value::Calculation::CalculationValue.new(
                number: Number.to_proto(value)
              )
            when Sass::Value::Calculation
              EmbeddedProtocol::Value::Calculation::CalculationValue.new(
                calculation: Calculation.to_proto(value)
              )
            when Sass::Value::String
              EmbeddedProtocol::Value::Calculation::CalculationValue.new(
                string: value.text
              )
            when Sass::CalculationValue::CalculationOperation
              EmbeddedProtocol::Value::Calculation::CalculationValue.new(
                operation: EmbeddedProtocol::Value::Calculation::CalculationOperation.new(
                  operator: CalculationOperator.to_proto(value.operator),
                  left: to_proto(value.left),
                  right: to_proto(value.right)
                )
              )
            else
              raise Sass::ScriptError, "Unknown CalculationValue #{value}"
            end
          end

          def from_proto(value)
            oneof = value.value
            obj = value.public_send(oneof)
            case oneof
            when :number
              Number.from_proto(obj)
            when :calculation
              Calculation.from_proto(obj)
            when :string
              Sass::Value::String.new(obj, quoted: false)
            when :operation
              Sass::CalculationValue::CalculationOperation.new(
                CalculationOperator.from_proto(obj.operator),
                from_proto(obj.left),
                from_proto(obj.right)
              )
            else
              raise Sass::ScriptError, "Unknown CalculationValue #{value}"
            end
          end
        end

        private_constant :CalculationValue

        # The {CalculationOperator} Protofier.
        module CalculationOperator
          module_function

          def to_proto(operator)
            case operator
            when '+'
              :PLUS
            when '-'
              :MINUS
            when '*'
              :TIMES
            when '/'
              :DIVIDE
            else
              raise Sass::ScriptError, "Unknown CalculationOperator #{separator}"
            end
          end

          def from_proto(operator)
            case operator
            when :PLUS
              '+'
            when :MINUS
              '-'
            when :TIMES
              '*'
            when :DIVIDE
              '/'
            else
              raise Sass::ScriptError, "Unknown CalculationOperator #{separator}"
            end
          end
        end

        private_constant :CalculationOperator

        # The {ListSeparator} Protofier.
        module ListSeparator
          module_function

          def to_proto(separator)
            case separator
            when ','
              :COMMA
            when ' '
              :SPACE
            when '/'
              :SLASH
            when nil
              :UNDECIDED
            else
              raise Sass::ScriptError, "Unknown ListSeparator #{separator}"
            end
          end

          def from_proto(separator)
            case separator
            when :COMMA
              ','
            when :SPACE
              ' '
            when :SLASH
              '/'
            when :UNDECIDED
              nil
            else
              raise Sass::ScriptError, "Unknown ListSeparator #{separator}"
            end
          end
        end

        private_constant :ListSeparator
      end

      private_constant :Protofier
    end
  end
end
