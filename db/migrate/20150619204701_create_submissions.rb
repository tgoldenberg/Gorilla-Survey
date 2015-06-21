class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
