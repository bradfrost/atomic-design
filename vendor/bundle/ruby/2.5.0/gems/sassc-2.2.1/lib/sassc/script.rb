# frozen_string_literal: true

module SassC
  module Script

    def self.custom_functions
      Functions.public_instance_methods
    end

    def self.formatted_function_name(function_name)
      params = Functions.instance_method(function_name).parameters
      params = params.map { |param_type, name| "$#{name}#{': null' if param_type == :opt}" }.join(", ")
      return "#{function_name}(#{params})"
    end

  end
end
