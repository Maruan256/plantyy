class Review < ApplicationRecord
  belongs_to :garden_kit
  belongs_to :user
end
