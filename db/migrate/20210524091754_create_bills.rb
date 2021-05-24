class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.integer :amount_excluding_tax_cents
      t.integer :amount_added_value_tax_cents
      t.integer :amoun_including_tax_cents

      t.timestamps
    end
  end
end
