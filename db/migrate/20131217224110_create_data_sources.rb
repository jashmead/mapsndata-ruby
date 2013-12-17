class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources do |t|
      t.integer :map_id, { null: nil }

      t.string :name, { null: nil }
      t.text :description

      t.string :url
      t.string :email
      t.string :contact_name

      t.text :address
      t.decimal :longitude
      t.decimal :latitude
      t.decimal :x_pos
      t.decimal :y_pos
      t.decimal :x_width
      t.decimal :y_width

      t.timestamps
    end
  end
end
