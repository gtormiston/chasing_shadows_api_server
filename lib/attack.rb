class Attack
  def self.run(enemy, attacker)
    if enemy.within_range_of(attacker)
      enemy.damage
      ""
    else
      "#{enemy.name} is not within attack range of #{attacker.name}!"
    end
  end

end
