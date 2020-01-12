class AddStatusToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :status, :intege, default: 0
  end
end
