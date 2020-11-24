class AddMaxPointsToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :max_points, :decimal
  end
end
