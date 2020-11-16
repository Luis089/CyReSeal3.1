class CreatePartakers < ActiveRecord::Migration[6.0]
    def change
      create_table :partakers do |t|
        t.string :role
        t.timestamps
      end
    end
end
