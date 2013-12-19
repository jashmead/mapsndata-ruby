class AddAvatarColumnsToMaps < ActiveRecord::Migration
  def self.up
    add_attachment :maps, :avatar
  end
  def self.down
    remove_attachment :maps, :avatar
  end
end
