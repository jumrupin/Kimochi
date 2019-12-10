class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :want

      t.timestamps
    end
  end
end
