class Survey < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :questions
  has_many :submissions
end
