class Restaurant < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :business_hours
  accepts_nested_attributes_for :business_hours
end
