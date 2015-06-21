class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.references :submission, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.string :value

      t.timestamps null: false
    end
  end
end
