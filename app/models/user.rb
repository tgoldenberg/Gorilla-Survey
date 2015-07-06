class User < ActiveRecord::Base
  validates_presence_of :username, :password
  has_secure_password
  has_many :surveys
end
