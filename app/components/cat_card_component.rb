class CatCardComponent < ViewComponent::Base
  def initialize(cat:)
    @cat = cat
  end

  def call
    content_tag :div, class: "border p-4 rounded-lg w-44 h-36" do
      safe_join([
        content_tag(:h3, @cat.name, class: "font-bold"),
        content_tag(:p, "#{@cat.age} 歳", class: "text-gray-500"),
        content_tag(:p, @cat.gender, class: "text-gray-500"),
        content_tag(:p, @cat.short_description || "ショートコメント", class: "text-gray-500")
      ])
    end
  end
end
