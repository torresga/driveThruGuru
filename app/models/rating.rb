class Rating < ApplicationRecord
  belongs_to :review

  validates :rating, presence: true, inclusion: { in: 1.0..5.0 }
end
