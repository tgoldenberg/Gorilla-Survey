class Submission < ActiveRecord::Base
  belongs_to :survey, dependent: :destroy
  has_many :user_answers
end
