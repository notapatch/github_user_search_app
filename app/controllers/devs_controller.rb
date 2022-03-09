class DevsController < ApplicationController
  def show
    @dev = Dev.new
    return unless params[:search]

    begin
      response = GithubApi::V3::Client.new.users(params[:search])
      @dev = Dev.new(**response)
    rescue ApiExceptions::NotFoundError
      @dev.errors.add(:name, message: "No results")
    end
  end
end
