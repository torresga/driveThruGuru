class ChangeBusinessHoursColumnDataType < ActiveRecord::Migration[6.0]
  def change
    remove_column :business_hours, :open_at
    remove_column :business_hours, :close_at
    add_column :business_hours, :open_at, :time
    add_column :business_hours, :close_at, :time
  end
end
