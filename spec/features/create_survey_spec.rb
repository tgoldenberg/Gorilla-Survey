require "rails_helper"

describe "Create Survey" do
  let(:user){ User.create(username: "Mike", password: "password")}

  it "should display a form to create a survey" do
    # visit "/"
    # click_link("Login")
    # fill_in('user_username', :with => user.username)
    # fill_in('user_password', :with => user.password)
    # click_button('Login')
    # click_link("Create a survey")
    # expect(page).to have_content("Create a new survey!")
  end
end
