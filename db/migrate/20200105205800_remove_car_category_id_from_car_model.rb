class RemoveCarCategoryIdFromCarModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :car_models, :car_category_id, :string
  end
end
