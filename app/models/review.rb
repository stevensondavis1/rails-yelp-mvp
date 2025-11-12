class Review < ApplicationRecord
  # Association: A review belongs to a single restaurant
  belongs_to :restaurant

  validates :content, :rating, presence: true

  validates :rating, numericality: { only_integer: true,
      in: 0..5,message: "must be an integer between 0 and 5"
   }
end
