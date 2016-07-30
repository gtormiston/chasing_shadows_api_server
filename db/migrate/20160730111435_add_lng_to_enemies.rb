class AddLngToEnemies < ActiveRecord::Migration[5.0]
  def change
    add_column :enemies, :lng, :float
  end
end
