class Attack
  def self.run(enemy, attacker)
    if enemy.within_range_of(attacker)
      enemy.damage
      "You've successfully attacked #{enemy.name}!"
    else
      "#{enemy.name} is not within attack range!"
    end
  end

end
