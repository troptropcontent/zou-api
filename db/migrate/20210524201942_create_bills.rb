class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.string :reference
      t.integer :total_excluding_tax_cents
      t.integer :total_added_value_tax_cents
      t.integer :total_including_tax_cents

      t.timestamps
    end
  end
end
