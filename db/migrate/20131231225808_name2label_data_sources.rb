class Name2labelDataSources < ActiveRecord::Migration
  def change
    rename_column :data_sources, :name, :label
    rename_column :data_sources, :description, :details
  end
end
