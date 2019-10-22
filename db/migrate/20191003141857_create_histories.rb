class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :supporter_id
      t.integer :victim_id
      t.integer :supply_id
      t.string :shipping
      t.string :receipt_status, default: '準備中'

      t.timestamps
    end
  end
end
