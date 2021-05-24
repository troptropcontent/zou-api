class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :address_number
      t.string :address_street
      t.string :address_complement
      t.string :address_city
      t.string :address_zip
      t.string :address_country

      t.timestamps
    end
  end
end
