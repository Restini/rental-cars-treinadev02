class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary

  # has_one :category, through: :car_model
  enum status: [available: 0] 
end
