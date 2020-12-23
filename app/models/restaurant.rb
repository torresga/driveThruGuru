class Restaurant < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :business_hours
  accepts_nested_attributes_for :business_hours
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1}
  validates :chain, presence: true
  validates :categories, presence: true
  validates :address, presence: true
  validates :business_hours, presence: true
  validates :phone_number, presence: true

  before_save :capitalize_name

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
