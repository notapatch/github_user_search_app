class DevsController < ApplicationController
  def show
    @dev = Dev.new
    return unless search_query

    @search_query = SearchQuery.new(q: search_query)

    begin
      response = GithubApi::V3::Client.new.users(search_query)
      @dev = Dev.new(**response)
    rescue ApiExceptions::ForbiddenError
      @dev.errors.add(:name, message: "API rate limit exceeded")
    rescue ApiExceptions::NotFoundError
      @dev.errors.add(:name, message: "No results")
    end
  end

  private

  def search_query
    params.dig(:search_query, :q)
  end
end
