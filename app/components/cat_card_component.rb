class CatCardComponent < ViewComponent::Base
  with_collection_parameter :cat

  def initialize(cat:)
    @cat = cat
  end

  def call
    link_to cat_path(@cat), class: "card-container" do
      content_tag :div do
        image = @cat.cat_images.first&.image_url || asset_path("sample_cat_image.jpeg")
        safe_join([
          content_tag(:div, class: "image-container") do
            image_tag(image, class: "square-image")
          end,
          content_tag(:div, class: "flex justify-center mt-2 space-x-card-status") do
            safe_join([
              content_tag(:div, class: "status-box") do
                content_tag(:h3, @cat.name, class: "font-bold text-gray-500")
              end,
              content_tag(:div, class: "status-box") do
              content_tag(:p, "#{@cat.age} 歳", class: "font-bold text-gray-500")
              end,
              content_tag(:div, class: "status-box") do
              content_tag(:p, @cat.gender, class: "font-bold text-gray-500")
              end
            ])
          end,
          content_tag(:p, @cat.short_description, class: "short-comment-box text-gray-500 mt-4 text-center")
        ])
      end
    end
  end
end
