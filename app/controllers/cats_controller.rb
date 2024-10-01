class CatsController < ApplicationController
  def index
    @cats = Cat.includes(:user)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
