class AddEnemyRefToEnemyLocation < ActiveRecord::Migration[5.0]
  def change
    add_reference :enemy_locations, :enemy, foreign_key: true
  end
end
