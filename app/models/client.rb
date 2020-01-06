class Client < ApplicationRecord
  validates :email, presence: { message: 'Email não pode ficar em branco' }
  validates :name, presence: { message: 'Nome não pode ficar em branco' }
  validates :document, presence: { message: 'CPF não pode ficar em branco' }
  has_many :rentals
  
  def description
  "#{name} - #{document}"
  end
end
