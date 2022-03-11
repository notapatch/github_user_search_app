require "faraday"

module GithubApi
  module V3
    class Client
      API_ENDPOINT = "https://api.github.com".freeze

      def initialize(adapter: Faraday.default_adapter, stubs: nil)
        @adapter = adapter
        @stubs = stubs
      end

      def users(username)
        result = client.get("users/#{username}")
        response = Response.new(result)

        raise response.error_class, response.message if response.failed?

        response.body
      end

      private

      class Response
        include HttpStatusCodes
        include ApiExceptions
        def initialize(response)
          @response = response
        end

        def body
          @response.body
        end

        def message
          "Code: #{@response.status}, response: #{@response.body['message']}"
        end

        def error_class
          case @response.status
          when HTTP_FORBIDDEN_CODE
            ForbiddenError
          when HTTP_NOT_FOUND_CODE
            NotFoundError
          end
        end

        def failed?
          @response.status != HTTP_OK_CODE
        end
      end

      def client
        @client = Faraday.new(API_ENDPOINT) do |f|
          f.request :json
          f.response :json
          f.adapter @adapter, @stubs
        end
      end
    end
  end
end
