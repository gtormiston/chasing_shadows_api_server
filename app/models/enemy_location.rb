class EnemyLocation < ApplicationRecord
  acts_as_mappable 
  belongs_to :enemy
end
