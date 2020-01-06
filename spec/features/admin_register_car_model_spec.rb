require 'rails_helper'

feature 'Admin register car model' do
  scenario 'successfully' do
    Manufacturer.create!(name: 'Chevrolet')
    Manufacturer.create!(name: 'Honda')
    CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 50,
                        third_party_insurance: 90)
    CarCategory.create!(name: 'B', daily_rate: 200, car_insurance: 150,
                        third_party_insurance: 190)
    user = User.create!(email:'test@test.com', password:'123456')
    login_as(user, :scope => :user)

    visit root_path
    click_on 'Modelos de Carro'
    click_on 'Registrar novo modelo'
    fill_in 'Nome', with: 'Onix'
    fill_in 'Ano', with: '2020'
    fill_in 'Motorização', with: '1.0'
    fill_in 'Combustível', with: 'Flex'
    select 'Chevrolet', from: 'Fabricante'
    
    click_on 'Enviar'

    expect(page).to have_content('Modelo registrado com sucesso')
    expect(page).to have_content('Onix')
    expect(page).to have_content('Ano: 2020')
    expect(page).to have_content('Fabricante: Chevrolet')
  end

  scenario 'validate mandatory fields' do
    Manufacturer.create!(name: 'Chevrolet')
    CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 50,
                        third_party_insurance: 90)
    user = User.create!(email:'test@test.com', password:'123456')
    login_as(user, :scope => :user)

    visit root_path
    click_on 'Modelos de Carro'
    click_on 'Registrar novo modelo'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Favor preencher todos os campos')
  end
end
