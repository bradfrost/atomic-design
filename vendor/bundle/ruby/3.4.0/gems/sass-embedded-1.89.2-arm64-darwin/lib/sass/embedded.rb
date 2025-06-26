# frozen_string_literal: true

require_relative 'compiler'

# The Sass module.
#
# This communicates with Embedded Dart Sass using the Embedded Sass protocol.
#
# @example
#   Sass.compile('style.scss')
#
# @example
#   Sass.compile_string('h1 { font-size: 40px; }')
module Sass
  @compiler = nil
  @mutex = Mutex.new

  # rubocop:disable Layout/LineLength
  class << self
    # Compiles the Sass file at +path+ to CSS.
    # @overload compile(path, load_paths: [], charset: true, source_map: false, source_map_include_sources: false, style: :expanded, functions: {}, importers: [], alert_ascii: false, alert_color: nil, fatal_deprecations: [], future_deprecations: [], logger: nil, quiet_deps: false, silence_deprecations: [], verbose: false)
    # @param (see Compiler#compile)
    # @return (see Compiler#compile)
    # @raise (see Compiler#compile)
    # @see Compiler#compile
    def compile(...)
      compiler.compile(...)
    end

    # Compiles a stylesheet whose contents is +source+ to CSS.
    # @overload compile_string(source, importer: nil, load_paths: [], syntax: :scss, url: nil, charset: true, source_map: false, source_map_include_sources: false, style: :expanded, functions: {}, importers: [], alert_ascii: false, alert_color: nil, fatal_deprecations: [], future_deprecations: [], logger: nil, quiet_deps: false, silence_deprecations: [], verbose: false)
    # @param (see Compiler#compile_string)
    # @return (see Compiler#compile_string)
    # @raise (see Compiler#compile_string)
    # @see Compiler#compile_string
    def compile_string(...)
      compiler.compile_string(...)
    end

    # @param (see Compiler#info)
    # @return (see Compiler#info)
    # @raise (see Compiler#info)
    # @see Compiler#info
    def info
      compiler.info
    end

    private

    def compiler
      return @compiler if @compiler

      @mutex.synchronize do
        return @compiler if @compiler

        compiler = Compiler.allocate
        compiler.instance_variable_set(:@channel, Compiler.const_get(:Channel).new(idle_timeout: 10))

        at_exit do
          compiler.close
        end

        @compiler = compiler
      end
    end
  end
  # rubocop:enable Layout/LineLength
end
