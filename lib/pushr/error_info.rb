module Pushr
  class ErrorInfo
    attr_reader :title, :source, :link, :icon

    def initialize e
      @title  = e.message
      @source = "Pushr: #{e.class}"
      @link   = 'http://github.com/Tomohiro/pushr'
      @icon   = nil
    end
  end
end
