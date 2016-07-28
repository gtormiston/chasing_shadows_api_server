class UserLocation < ApplicationRecord
  belongs_to :user
  acts_as_mappable :default_units => :kms
end
