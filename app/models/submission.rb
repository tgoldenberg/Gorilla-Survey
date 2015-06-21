class Submission < ActiveRecord::Base
  belongs_to :survey
  has_many :user_answers
end
