class Enemy < ApplicationRecord
    RANGE = 5
    acts_as_mappable

    def self.within_range_of(user)
      Enemy.within(RANGE, origin: [user.lat, user.lng]).select(&:active)
    end

    def within_range_of(attacker)
      Enemy.within_range_of(attacker).include? self
    end

    def damage
      self.size -= 1
      deactivate if dead?
    end

    private

    def deactivate
      self.active = false
    end

    def dead?
      self.size <= 0
    end
end
