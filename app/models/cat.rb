class Cat < ApplicationRecord
  belongs_to :user
  has_many :cat_images, dependent: :destroy

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
