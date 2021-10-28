# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

# Ruby toolkit for the 1Password Connect REST API.
#
module OpConnect
  autoload :Client, "op_connect/client"
  autoload :Configurable, "op_connect/configurable"
  autoload :Connection, "op_connect/connection"
  autoload :Default, "op_connect/default"
  autoload :Object, "op_connect/object"
  autoload :Response, "op_connect/response"

  autoload :Error, "op_connect/error"
  autoload :ClientError, "op_connect/error"
  autoload :BadRequest, "op_connect/error"
  autoload :Forbidden, "op_connect/error"
  autoload :NotFound, "op_connect/error"
  autoload :PayloadTooLarge, "op_connect/error"
  autoload :Unauthorized, "op_connect/error"
  autoload :ServerError, "op_connect/error"
  autoload :InternalServerError, "op_connect/error"
  autoload :ServiceUnavailable, "op_connect/error"

  class << self
    include OpConnect::Configurable

    # API client based on configured options {Configurable}
    #
    # @return [OpConnect::Client] API wrapper
    #
    def client
      return @client if defined?(@client) && @client.same_options?(options)
      @client = OpConnect::Client.new(options)
    end
  end
end

OpConnect.setup
