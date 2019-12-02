require 'rails_helper'

feature 'Admin register manufecture' do
  scenario 'successfully' do
    
    visit root_path
    click_on 'Fabricantes'
    
    expect(page).to have_link('Registrar novo fabricante')
  end
  
  scenario 'and must fill in all fields' do
    visit new_manufacturer_path
    #fill_in 'Nome', with:
    click_on Enviar

    expect(page).to have_content('Favor preencher todos os campos')
  end

  scenario 'and name must be unique' do
    Manufecture.create(name: 'Fiat')
    
    visit new_manufacturer_path
    fill_in 'Nome', with:
    click_on Enviar
    
    expect(page).to have_content('Nome já esta em uso')
  end
end