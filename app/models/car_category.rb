class CarCategory < ApplicationRecord
    validates :name, presence: true
    validates :daily_rate, presence: true
    validates :car_insurance, presence: true
    validates :third_party_insurance, presence: true
end
