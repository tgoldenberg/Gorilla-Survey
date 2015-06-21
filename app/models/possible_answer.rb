class PossibleAnswer < ActiveRecord::Base
  before_create :assign_count
  belongs_to :question, dependent: :destroy

  def assign_count
    self.count = 0
  end
end
