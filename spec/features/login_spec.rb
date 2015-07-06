require 'rails_helper'

describe 'Login' do
  let(:user){ User.create(username: "Tom", password: "password")}
  it 'should have a link to the login form from the landing page' do
    visit "/"
    click_link("Login")
    expect(page).to have_content("Please Log-In:")
  end

  it 'should log in a registered user' do
    visit '/login'
    fill_in('user_username', :with => user.username)
    fill_in('user_password', :with => user.password)
    click_button('Login')
    save_and_open_page
    expect(page).to have_content('Happy to have you here')
  end


end
