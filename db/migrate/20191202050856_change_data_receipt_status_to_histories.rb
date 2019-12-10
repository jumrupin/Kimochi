class ChangeDataReceiptStatusToHistories < ActiveRecord::Migration[5.2]
  def change
    change_column :histories, :receipt_status, :integer, default: 0
    add_index :histories, :receipt_status
  end
end
