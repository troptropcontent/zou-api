class CreateBillLines < ActiveRecord::Migration[6.1]
  def change
    create_table :bill_lines do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true
      t.integer :quantity
      t.integer :amount_excluding_tax_cents
      t.integer :amount_added_value_tax_cents
      t.string :amount_including_tax_cents

      t.timestamps
    end
  end
end
