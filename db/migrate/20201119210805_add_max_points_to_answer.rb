class AddMaxPointsToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :max_points, :integer
  end
end
