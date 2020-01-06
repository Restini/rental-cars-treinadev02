class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary
  enum status: { available: 0, unavailable: 5 }
  has_many :car_rentals, dependent: :destroy
  has_many :rentals, through: :car_rentals, dependent: :destroy
  
  def name
  "#{car_model.name} - #{license_plate}"
  end
  
  def price
  car_category.daily_rate +
  car_category.third_party_insurance +
  car_category.car_insurance
  end
end
