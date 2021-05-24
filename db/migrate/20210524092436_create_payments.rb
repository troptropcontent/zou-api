class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :source
      t.integer :amount_cents
      t.integer :status

      t.timestamps
    end
  end
end
