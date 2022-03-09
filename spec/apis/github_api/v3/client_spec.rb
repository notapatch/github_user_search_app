require "rails_helper"

module GithubApi
  module V3
    RSpec.describe Client do
      it "returns known user data" do
        stubs = Faraday::Adapter::Test::Stubs.new do |stub|
          stub.get("users/octocat") do |_env|
            [
              200,
              { "Content-Type" => "application/json" },
              File.read("spec/fixtures/github_api/v3/users/retrieve.json")
            ]
          end
        end
        response = described_class.new(adapter: :test, stubs: stubs).users("octocat")

        expect(response["name"]).to eq "The Octocat"
      end

      it "returns error for unknown user" do
        expect do
          stubs = Faraday::Adapter::Test::Stubs.new do |stub|
            stub.get("users/nobody_on_github") do |_env|
              [
                404,
                { "Content-Type" => "application/json" },
                File.read("spec/fixtures/github_api/v3/users/404.json")
              ]
            end
          end

          described_class.new(adapter: :test, stubs: stubs).users("nobody_on_github")
        end.to raise_error(ApiExceptions::NotFoundError)
      end
    end
  end
end
