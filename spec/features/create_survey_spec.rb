require "rails_helper"

describe "Create Survey" do
  let(:user){ User.create(username: "Mike", password: "password")}

  scenario "should display a form to create a survey", js: true do
    visit "/"
    click_link("Login")
    fill_in('user_username', :with => user.username)
    fill_in('user_password', :with => user.password)
    click_button('Login')
    visit new_survey_path
    save_and_open_page
    fill_in("title_field", :with => 'Survey')
    fill_in("question", :with => 'WTF?')
    find('#add-question').click
    save_and_open_page
    expect(page.find("#survey_submit")[:class].include?("hidden")).to eq(false)
  end
end
