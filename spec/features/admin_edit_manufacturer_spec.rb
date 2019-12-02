require 'rails_helper'

feature 'Admin edit manufecture' do
  scenario 'successfully' do
  Manufacturer.create.(name: 'Fiat')
  Manufacturer.create.(name: 'Honda')
  
  visit root_path
  click_on 'Fabricante'
  click_on 'Fiat'
  click_on 'Edit'
  fill_in 'Name', with: ''
  click_on 'Enviar'

  expect(page).to have_content('Registrar novo fabricante')
end

  scenario 'and must be unique' do
  Manufacturer.create(name: 'Fiat')
  Manufacturer.create.(name: 'Honda')

  visit root_path
  click_on 'Fabricante'
  click_on 'Fiat'
  click_on 'Edit'
  fill_in 'Name', with: ''
  
  expect(page).to have_content('Voce deve corrigir os seguintes erros')
end

end