class CatCardComponent < ViewComponent::Base
  with_collection_parameter :cat

  def initialize(cat:)
    @cat = cat
  end

  def call
    content_tag :div, class: "card-container" do
      image = @cat.cat_images.first&.image_url || asset_path('sample_cat_image.jpeg')
      safe_join([
        content_tag(:div, class: "image-container") do
          image_tag(image, class: "square-image")
        end,
        content_tag(:h3, @cat.name, class: "font-bold"),
        content_tag(:p, "#{@cat.age} 歳", class: "text-gray-500"),
        content_tag(:p, @cat.gender, class: "text-gray-500"),
        content_tag(:p, @cat.short_description || "ショートコメント", class: "text-gray-500")
      ])
    end
  end
end
