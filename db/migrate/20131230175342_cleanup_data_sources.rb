class CleanupDataSources < ActiveRecord::Migration
  def change
    rename_column :data_sources, :x_width, :ds_width
    rename_column :data_sources, :y_width, :ds_height
    rename_column :data_sources, :x_pos, :ds_x
    rename_column :data_sources, :y_pos, :ds_y
    remove_column :data_sources, :longitude
    remove_column :data_sources, :latitude
  end
end
