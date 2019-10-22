class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|

      t.integer :category_id
      t.integer :supply_id
      
      t.timestamps
    end
  end
end
