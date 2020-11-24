class AddPointWeightingToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :point_weighting, :decimal
  end
end
