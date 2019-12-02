require 'rails_helper'

feature 'Admin view subsidiary' do
  scenario 'successfully' do
   Subsidiary.create(name: 'Almeidinha Cars', cnpj: '00.000.000/0000', 
                     address: 'Alameda Santos, 1293')
   Subsidiary.create(name: 'Almeidinha Trucks', cnpj: '00.000.000/0000', 
                     address: 'Alameda Santos, 1293')                   
  visit root_path
  click_on 'Filiais'
  
  expect(page).to have_content('Almeidinha Cars')
  expect(page).to have_content('00.000.000/0000')
  expect(page).to have_content('Alameda Santos, 1293')
  expect(page).to have_link('Almeidinha Cars')
  expect(page).to have_link('Almeidinha Trucks')
  end
end