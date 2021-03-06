require 'publisher/gmail'
require 'subscriber/boxcar'

module Pushr
  class Server
    def initialize
      @logger = Pushr.logger Module.nesting.first
    end

    def run
      begin
        @logger.info 'Run'

        @publisher  = Pushr::Publisher::Gmail.new $config
        @subscriber = Pushr::Subscriber::Boxcar.new $config

        loop do
          @publisher.start { |info| @subscriber.notify info }
          sleep 30
        end

      rescue Exception => e
        @logger.error e
        @logger.error 'Retry after 300 seconds'
        sleep 300
        retry
      ensure
        @publisher.destruct
        @subscriber.destruct
      end
    end

    def self.run
      self.new.run
    end
  end
end
