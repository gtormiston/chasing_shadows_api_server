class Attack
  def self.run(enemy, attacker)
    enemy.damage if enemy.within_range_of(attacker)
  end
end
