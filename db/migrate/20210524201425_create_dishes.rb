class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.references :menu, null: false, foreign_key: true
      t.integer :course
      t.string :name
      t.integer :price_excluding_tax_cents
      t.integer :added_value_tax
      t.integer :amount_added_value_tax_cents
      t.string :price_including_tax_cents

      t.timestamps
    end
  end
end
