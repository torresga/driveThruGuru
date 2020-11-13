class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :chain
      t.text :address
      t.text :phone_number
      t.text :hours_of_operation

      t.timestamps
    end
  end
end
