class CleanUpUsersTable < ActiveRecord::Migration
  def self.up
    remove_column :users, :address
    remove_column :users, :longitude
    remove_column :users, :latitude
  end
  def self.down
    add_column :users, :address, :string
    add_column :users, :longitude, :decimal
    add_column :users, :latitude, :decimal
  end
end
