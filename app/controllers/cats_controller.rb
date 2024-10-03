class CatsController < ApplicationController
  def index
    @cats = Cat.includes(:user).limit(20)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @cat = Cat.find(params[:id])
    @cat.cat_images = @cat.cat_images.order(:created_at)
  end
end
