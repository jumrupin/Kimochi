class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|

      t.integer :supply_id
      t.string :supply_image_id

      t.timestamps
    end
  end
end
