class PagesController < ApplicationController
  def home
    @user = User.new
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
