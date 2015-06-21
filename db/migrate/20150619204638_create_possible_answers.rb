class CreatePossibleAnswers < ActiveRecord::Migration
  def change
    create_table :possible_answers do |t|
      t.references :question, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
