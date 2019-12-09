require 'rails_helper'

feature 'user sign in' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456')

    visit user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'
        
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar')
  end
end