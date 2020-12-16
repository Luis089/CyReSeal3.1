class AddPointWeightingtoAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :point_weighting, :decimal
  end
end
