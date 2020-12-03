class CreateBusinessHours < ActiveRecord::Migration[6.0]
  def change
    create_table :business_hours do |t|
      t.string :day
      t.integer :open_at
      t.integer :close_at
      t.timestamps
    end
  end
end
