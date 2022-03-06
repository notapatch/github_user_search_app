module GithubApi
  module V3
    class Client
      API_ENDPOINT = "https://api.github.com".freeze

      def users(username)
        response = client.get("users/#{username}")
        response.body
      end

      private

      def client
        @client = Faraday.new(API_ENDPOINT) do |f|
          f.request :json
          f.response :json
        end
      end
    end
  end
end
