class RemoveCarModelIdFromCarCategory < ActiveRecord::Migration[5.2]
  def change
    remove_column :car_categories, :car_model_id, :string
  end
end
