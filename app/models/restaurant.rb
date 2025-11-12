class Restaurant < ApplicationRecord

  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, phone_number: , presence: true

  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :category, inclusion: { in: CATEGORIES,
     message:
      "%{value} is not a valid category" }
end
