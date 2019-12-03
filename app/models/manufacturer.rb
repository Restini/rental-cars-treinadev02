class Manufacturer < ApplicationRecord
  validates :name, presence: { message: 'Favor preenchear todos os dados'}
  validates :name, uniqueness: { message: 'Nome já está em uso'}
end
