class CatsController < ApplicationController
  def index
    @cats = Cat.includes(:user).limit(20)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def new
    @cat = Cat.new
  end

  def show
    @cat = Cat.find(params[:id]) # ユーザーの猫を取得
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id if user_signed_in?

    if @cat.save
      redirect_to @cat, notice: "猫のプロフィールが作成されました。"
    else
      render :new
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :gender, :age, :breed, :color, :pattern, :short_description, :long_description, images: [])
  end

  def upload_images_to_s3(cat)
    s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])
    image_urls = []

    cat.images.each do |image|
      next if image.blank? || image.is_a?(String)

      begin
        obj = s3.bucket("nyandexapp-images").object("cats/#{cat.id}/#{File.basename(image.tempfile)}")
        obj.upload_file(image.tempfile)

        image_urls << obj.public_url
      rescue => e
      end
    end

    cat.update(images: image_urls) if image_urls.any?
  end
end
