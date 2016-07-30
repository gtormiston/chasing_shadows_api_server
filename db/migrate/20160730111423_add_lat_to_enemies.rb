class AddLatToEnemies < ActiveRecord::Migration[5.0]
  def change
    add_column :enemies, :lat, :float
  end
end
