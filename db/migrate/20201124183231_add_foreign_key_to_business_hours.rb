class AddForeignKeyToBusinessHours < ActiveRecord::Migration[6.0]
  def change
    add_reference :business_hours, :restaurant
  end
end
