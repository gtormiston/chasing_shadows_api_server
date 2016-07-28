class AddUserRefToUserLocation < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_locations, :user, foreign_key: true
  end
end
