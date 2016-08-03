class Enemy < ApplicationRecord
  RANGE = 2
  RANGE_OF_ATTACK = 2
  acts_as_mappable

  def self.within_range_of(user, range = RANGE)
    Enemy.within(range, origin: [user.lat, user.lng]).select(&:active)
  end

  def within_range_of(attacker, range = RANGE_OF_ATTACK)
    Enemy.within_range_of(attacker, range).include? self
  end

  def damage
    self.size -= 1
    deactivate if dead?
  end

  def dead?
    self.size <= 0
  end

  private

  def deactivate
    self.active = false
    setActiveTimer = 60
  end

end
