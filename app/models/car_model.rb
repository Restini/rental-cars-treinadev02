class CarModel < ApplicationRecord
  validates :name, presence: true
  validates :motorization, presence: true
  validates :year, presence: true
  validates :fuel_type, presence: true
  validates :manufacturer_id, presence: true
  validates :car_category_id, presence: true
    
  belongs_to :manufacturer
  belongs_to :car_category
end
