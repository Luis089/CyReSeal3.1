class AddPartakerIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :partaker_id, :integer
  end
end
