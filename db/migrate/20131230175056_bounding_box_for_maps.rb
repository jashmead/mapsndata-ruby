class BoundingBoxForMaps < ActiveRecord::Migration
  def change
    add_column :maps, :map_x, :numeric
    add_column :maps, :map_y, :numeric
  end
end
