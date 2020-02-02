# frozen_string_literal: true

module SassC
  module Native
    module LibC
      extend FFI::Library
      ffi_lib FFI::Library::LIBC

      # memory allocators
      attach_function :malloc, [:size_t], :pointer
      # attach_function :calloc, [:size_t], :pointer
      # attach_function :valloc, [:size_t], :pointer
      # attach_function :realloc, [:pointer, :size_t], :pointer
      # attach_function :free, [:pointer], :void

      # memory movers
      # attach_function :memcpy, [:pointer, :pointer, :size_t], :pointer
      # attach_function :bcopy, [:pointer, :pointer, :size_t], :void
    end
  end
end
