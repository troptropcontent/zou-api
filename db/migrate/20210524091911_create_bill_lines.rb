class CreateBillLines < ActiveRecord::Migration[6.1]
  def change
    create_table :bill_lines do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
