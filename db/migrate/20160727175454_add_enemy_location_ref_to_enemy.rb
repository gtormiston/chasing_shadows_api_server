class AddEnemyLocationRefToEnemy < ActiveRecord::Migration[5.0]
  def change
    add_reference :enemies, :enemy_location, foreign_key: true
  end
end
