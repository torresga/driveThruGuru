class BusinessHour < ApplicationRecord
  belongs_to :restaurant
  serialize :open_at, Tod::TimeOfDay
  serialize :close_at, Tod::TimeOfDay
end
