class ChangeLatFormatInUserLocations < ActiveRecord::Migration[5.0]
  def change
  change_column :user_locations, :lat, :float
  change_column :user_locations, :lng, :float
  end
end
