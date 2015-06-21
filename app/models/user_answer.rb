class UserAnswer < ActiveRecord::Base
  belongs_to :submission
  belongs_to :question
end
