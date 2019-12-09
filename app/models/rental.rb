class Rental < < ApplicationRecord
  belong_to :client
  belong_to :car_category

  validate: :end_date_must_be_greater_than_start_date

  it 'start date must exist' do

    client.Clien.new(name: 'Fulano Sicrano', email: 'funla@test.com',
                  cpf: '743.341.870-99'
    category = CarCategory.create(name: 'A', daily_rate: 30, car_insurence: 30,
                                  third_party_insurance: 30)

  end

  def end_date_must_be_greater_than_start_date
    end_date < start_date
  end
  
end