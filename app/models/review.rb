class Review < ApplicationRecord
  belongs_to :garden_kit
  belongs_to :user
  validates :content, presence: true, length: { minimum: 6 }
  validates :rating, presence: true
end
