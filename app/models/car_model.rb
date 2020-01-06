class CarModel < ApplicationRecord
  validates :name, presence: true
  belongs_to :manufacturer
  has_many :cars, dependent: :destroy
end
