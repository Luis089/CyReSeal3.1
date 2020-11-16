class Answers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :answer_text
      t.integer :points

      t.timestamps
    end
  end
end
