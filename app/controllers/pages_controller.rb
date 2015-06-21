class PagesController < ApplicationController
  def home
    @user = User.new
  end
end
