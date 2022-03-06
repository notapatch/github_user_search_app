class DevsController < ApplicationController
  def show
    return @dev = Dev.new unless params[:search]

    @dev = Dev.new
  end
end
