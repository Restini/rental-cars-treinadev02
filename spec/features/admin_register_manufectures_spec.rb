require 'rails_helper'

feature 'Admin register manufecture' do
  scenario 'successfully' do
    
    visit root_path
    click_on 'Fabricantes'
    
    expect(page).to have_link('Registrar novo fabricante')
  end
end