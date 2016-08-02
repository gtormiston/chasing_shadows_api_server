class User < ApplicationRecord

  acts_as_mappable
  has_one :user_location
  has_secure_password
  validates_uniqueness_of :email, :name
  validates_presence_of :name, :email

  before_create do |user|
    return "No password" unless user.password
    return "Passwords do not match" unless password_matches_confirmation?(user)
    user.api_key = user.generate_api_key
  end

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end

  private

  def password_matches_confirmation?(user)
    user.password == user.password_confirmation
  end
end
