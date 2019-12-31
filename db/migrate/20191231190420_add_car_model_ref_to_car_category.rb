class AddCarModelRefToCarCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :car_categories, :car_model, foreign_key: true
  end
end
