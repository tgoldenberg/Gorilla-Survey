require 'rails_helper'

describe PagesController do
  describe "GET root" do
    let(:user) { User.create(username: "Tom", password: "password") }
    let(:survey) {Survey.create(user_id: user.id, title: "My Survey") }
    it "shows the users surveys" do
      session[:user_id] = user.id
      get "home"
      expect(assigns(:user)).to eq(user)
    end
  end
end
