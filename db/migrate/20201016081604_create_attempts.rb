class CreateAttempts < ActiveRecord::Migration[6.0]
    def change
      create_table :attempts do |t|
        t.string :role
        t.timestamps
      end
    end
end
