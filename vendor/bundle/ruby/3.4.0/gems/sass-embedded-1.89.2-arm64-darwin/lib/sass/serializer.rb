# frozen_string_literal: true

module Sass
  # The {Serializer} module.
  module Serializer
    module_function

    CSS_ESCAPE = [*"\x01".."\x08", *"\x0A".."\x1F", "\x7F"]
                 .product([*'0'..'9', *'a'..'f', *'A'..'F', "\t", ' ', nil])
                 .each_with_object({ "\0" => "\uFFFD", '\\' => '\\\\', '"' => '\\"', "'" => "\\'" }) do |(c, x), h|
                   h["#{c}#{x}".freeze] = "\\#{c.ord.to_s(16)}#{" #{x}" if x}".freeze
                 end.freeze

    private_constant :CSS_ESCAPE

    def serialize_quoted_string(string)
      if !string.include?('"') || string.include?("'")
        %("#{string.gsub(/[\0\\"]|[\x01-\x08\x0A-\x1F\x7F][\h\t ]?/, CSS_ESCAPE)}")
      else
        %('#{string.gsub(/[\0\\']|[\x01-\x08\x0A-\x1F\x7F][\h\t ]?/, CSS_ESCAPE)}')
      end
    end

    def serialize_unquoted_string(string)
      string.tr("\0", "\uFFFD").gsub(/\n */, ' ')
    end
  end

  private_constant :Serializer
end
