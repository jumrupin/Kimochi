class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|

      t.integer :user_id
      t.string :title
      t.string :size
      t.string :shipping_preparation_period
      t.string :comment
      t.string :sales_status
      t.string :condition

      t.timestamps
    end
  end
end
