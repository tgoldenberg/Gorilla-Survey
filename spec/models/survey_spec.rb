require "rails_helper"

describe Survey do
  let(:user) {User.create(username: "Moikey", password: "password")}

  it "should allow user to view all of the surveys they create" do
    survey = Survey.create(user_id: user.id, title: "Whatever")
    expect(survey.user).to eq(user)
  end
end
