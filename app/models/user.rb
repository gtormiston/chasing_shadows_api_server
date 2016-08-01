class User < ApplicationRecord

  acts_as_mappable
  has_one :user_location
  has_secure_password
  validates_presence_of :name, :email


  before_create do |user|
    user.api_key = user.generate_api_key
  end

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end

end
