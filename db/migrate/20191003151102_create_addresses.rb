class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :postal_code
      t.string :prefecture
      t.string :municipal_district
      t.string :after_address
      
      t.timestamps
    end
  end
end
