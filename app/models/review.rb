class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_one :rating

  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :body, presence: true

  acts_as_taggable
  has_many_attached :images
end
