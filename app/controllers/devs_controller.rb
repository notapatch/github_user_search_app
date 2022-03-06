class DevsController < ApplicationController
  def show
    return @dev = Dev.new unless params[:search]

    response = GithubApi::V3::Client.new.users(params[:search])
    @dev = Dev.new(**response)
  end
end
