# frozen_string_literal: true

module Sass
  class Compiler
    # The {Dispatcher} class.
    #
    # It dispatches messages between multiple instances of {Host} and a single {Connection} to the compiler.
    class Dispatcher
      def initialize(idle_timeout: 0)
        @id = 1
        @observers = {}.compare_by_identity
        @mutex = Mutex.new
        @connection = Connection.new
        @connection.listen(self)
        ForkTracker.add(self)

        return unless idle_timeout.positive?

        @last_accessed_time = current_time
        Thread.new do
          Thread.current.name = "sass-embedded-connection-reaper-#{@connection.id}"
          duration = idle_timeout
          loop do
            sleep(duration.negative? ? idle_timeout : duration)
            break if @mutex.synchronize do
              raise Errno::EBUSY if _closed?

              duration = idle_timeout - (current_time - @last_accessed_time)
              duration.negative? && _idle? && _close
            end
          end
          close
        rescue Errno::EBUSY
          # do nothing
        end
      end

      def subscribe(observer)
        @mutex.synchronize do
          raise Errno::EBUSY if _closed?

          id = @id
          @id = id.next
          @observers[id] = observer
          id
        end
      end

      def unsubscribe(id)
        @mutex.synchronize do
          @observers.delete(id)

          return unless @observers.empty?

          if _closed?
            Thread.new do
              close
            end
          else
            _idle
          end
        end
      end

      def close
        @mutex.synchronize do
          _close
        end
        @connection.close
        ForkTracker.delete(self)
      end

      def closed?
        @connection.closed?
      end

      def error(error)
        observers = @mutex.synchronize do
          _close
          @observers.values
        end

        if observers.empty?
          close
        else
          observers.each do |observer|
            observer.error(error)
          end
        end
      end

      def receive_proto(id, proto)
        case id
        when 1...0xffffffff
          @mutex.synchronize { @observers[id] }&.receive_proto(proto)
        when 0
          outbound_message = EmbeddedProtocol::OutboundMessage.decode(proto)
          oneof = outbound_message.message
          message = outbound_message.public_send(oneof)
          @mutex.synchronize { @observers[message.id] }&.public_send(oneof, message)
        when 0xffffffff
          outbound_message = EmbeddedProtocol::OutboundMessage.decode(proto)
          oneof = outbound_message.message
          message = outbound_message.public_send(oneof)
          raise Errno::EPROTO, message.message
        else
          raise Errno::EPROTO
        end
      end

      def send_proto(...)
        @connection.write(...)
      end

      private

      def current_time
        Process.clock_gettime(Process::CLOCK_MONOTONIC)
      end

      def _close
        @id = 0xffffffff
      end

      def _closed?
        @id == 0xffffffff
      end

      def _idle
        @last_accessed_time = current_time if defined?(@last_accessed_time)

        @id = 1
      end

      def _idle?
        @id == 1
      end
    end

    private_constant :Dispatcher
  end
end
