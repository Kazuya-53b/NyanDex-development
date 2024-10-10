class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def size_range
    1..5.megabytes
  end

  # トリミング処理
  def crop_image(crop_params)
    manipulate! do |img|

      # 画像のサイズを制限
      img.resize "1200x1200>"

      # crop_paramsは{x: 左端, y: 上端, width: 幅, height: 高さ}のハッシュであることを仮定
      x = crop_params[:x]
      y = crop_params[:y]
      width = crop_params[:width]
      height = crop_params[:height]

      # トリミングを行い、正方形にする
      img.crop("#{width}x#{height}+#{x}+#{y}")
      img
    end
  end
end
