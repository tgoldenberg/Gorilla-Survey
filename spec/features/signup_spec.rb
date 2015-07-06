require 'rails_helper'

describe "Signup" do
  it "present a signup form from the landing page" do
    visit "/"
    click_link('sign up')
    expect(page).to have_content("Please Sign-Up:")
  end

  it 'should create a new user when the form is filled out' do
    visit "/signup"

    fill_in('user_username', :with => 'John')
    fill_in('user_password', :with => 'password')
    click_button("Sign-Up")
    expect(page).to have_content("Hello John!")
  end
end
