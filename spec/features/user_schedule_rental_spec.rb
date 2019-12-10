=begin
require 'rails_helper'

feature 'user schedule rental' do
  user = User.create(email: 'test@test.com', passwd: '1223456',
                     role: employee)
  login_as(user, :scope => :user)
  client.create(name: 'Fulano Sicrano', email: 'funla@test.com',
                cpf: '743.341.870-99'
  category = CarCategory.create(name: 'A', daily_rate: 30, car_insurence: 30,
                                third_party_insurance: 30)
  
  visit root_path
  click_on 'Locações'
  click_on 'Agendar locação'
  fill_in'Data de inicio', with: '09/12/2019'
  fill_in 'Data de fim', with: '08/12/2019'
  select '#{client.name}' - #{client.document}', from: 'Cliente'
  click_on



  it 'end date equal than start date' do
  end

  it 'start date must exist' do
  end

  it 'end date must exist' do
  end

end
=end