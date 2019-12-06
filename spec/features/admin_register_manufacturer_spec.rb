require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'successfully' do
    admin = User.create!(email:'test@test.com', password:'123456')
    login_as(user, scope: :user)
    #Escrever estas 2 linhas em todos os testes
    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('Fiat')
  end

  scenario 'and must fill in all fields' do
    visit new_manufacturer_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Favor preencher todos os campos')
  end

  scenario 'and name must be unique' do
    Manufacturer.create!(name: 'Fiat')

    visit new_manufacturer_path
    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'
    expect(page).to have_content('Nome já está em uso')
  end

  scenario 'and must be logged in' do
    visit new_manufacturer_path

    expect(current_path).to eq new_user_session_path
  end
end