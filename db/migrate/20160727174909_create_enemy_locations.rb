class CreateEnemyLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :enemy_locations do |t|
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
