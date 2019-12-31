class AddCarRefToCarCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :car_categories, :car, foreign_key: true
  end
end
