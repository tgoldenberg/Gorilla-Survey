require "rails_helper"

describe User do
  it "should not allow sign up without username" do
    params = {username: nil, password: "password"}
    user = User.create(params)
    expect(user).not_to be_valid
  end

  it "should not allow sign up without password" do
    params = {username: "Mike", password: nil}
    user = User.create(params)
    expect(user).not_to be_valid
  end

  it "should create only valid users" do
    user = User.create(username: "Moike", password: "password")
    expect(user).to be_valid
  end
end
