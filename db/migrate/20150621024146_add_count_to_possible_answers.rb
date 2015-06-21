class AddCountToPossibleAnswers < ActiveRecord::Migration
  def change
    add_column :possible_answers, :count, :integer
  end
end
