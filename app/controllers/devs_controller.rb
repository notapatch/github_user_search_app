class DevsController < ApplicationController
  def show
    @dev = Dev.new
    @search_query = SearchQuery.new(q: search_query_string)

    begin
      @dev = display_dev(search_query_string)
      session["last_user"] = search_query_string
    rescue ApiExceptions::UnauthorizedError
      @dev.errors.add(:name, "Authorization failed")
    rescue ApiExceptions::ForbiddenError
      @dev.errors.add(:name, "API rate limit exceeded")
    rescue ApiExceptions::NotFoundError
      @dev = display_dev(fallback_user, message: "No results")
    end
  end

  private

  def search_query_string
    params.dig(:search_query, :q) || fallback_user
  end

  def fallback_user
    session["last_user"] || "octocat"
  end

  def display_dev(user, message: nil)
    dev = Dev.new(**GithubApi::V3::Client.new(ENV["AUTHENTICATION_TOKEN"]).users(user))
    dev.errors.add(:name, message) if message
    dev
  end
end
