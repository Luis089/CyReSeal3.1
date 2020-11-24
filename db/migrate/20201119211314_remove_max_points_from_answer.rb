class RemoveMaxPointsFromAnswer < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :max_points, :integer
  end
end
