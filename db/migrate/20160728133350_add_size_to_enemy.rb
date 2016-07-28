class AddSizeToEnemy < ActiveRecord::Migration[5.0]
  def change
    add_column :enemies, :size, :integer
  end
end
