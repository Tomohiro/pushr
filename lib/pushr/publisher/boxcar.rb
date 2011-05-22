require 'rubygems'
require 'boxcar_api'

module Pushr
  module Publisher
    class Boxcar
      def initialize config
        @boxcar = BoxcarAPI::User.new config.boxcar_email, config.boxcar_password
      end

      def push info
        @boxcar.notify info.title, info.source, nil, info.link, info.icon
          $logger.info "Push to Boxcar #{info.title}"
      end

      def destruct
        @boxcar = nil
      end
    end
  end
end
