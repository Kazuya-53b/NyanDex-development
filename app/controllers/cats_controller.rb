class CatsController < ApplicationController
  def index
    @cats = Cat.includes(:user).limit(20)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
