class AddDsTypeToDataSources < ActiveRecord::Migration
  def change
    add_column :data_sources, :ds_type, :string, { default: 'point', null: nil }
  end
end
