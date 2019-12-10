=begin
require 'rails_helper'

feature 'User search rental' do
  user = User.create(email: 'test@test.com', passwd: '1223456',
                     role: employee)
  login_as(user, :scope => :user)
  client.create(name: 'Fulano Sicrano', email: 'funla@test.com',
                cpf: '743.341.870-99'
  category = CarCategory.create(name: 'A', daily_rate: 30, car_insurence: 30,
                                third_party_insurance: 30)

  rental = Rental.create(client: client, car_category: category,
                         start_date: 1.day.from_now, 
                         end_date: 2.days.from_now, 
                         reservation_code:'ABC1234')

  rental = Rental.create(client: client, car_category: category,
                         start_date: 1.day.from_now, 
                         end_date: 2.days.from_now, 
                         reservation_code:'ABC1234')

  visit root_path
  click_on 'Locações'
  fill_in 'Códigom', with: rental.reservatio_code
  click_on 'Buscar'

  expect(page).to have_content(rental.reservatio_code)
  expect(page).not_to have_content(other_rental.reservatio_code)   
end
=end
