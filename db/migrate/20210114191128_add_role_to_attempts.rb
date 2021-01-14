class AddRoleToAttempts < ActiveRecord::Migration[6.0]
   def change
    add_column :attempts, :role, :string
  end
end