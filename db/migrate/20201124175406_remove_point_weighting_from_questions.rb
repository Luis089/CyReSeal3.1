class RemovePointWeightingFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :point_weighting, :decimal
  end
end
