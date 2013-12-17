class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.integer :user_id
      t.string :map_type, { default: 'blank', null: nil }
      t.string :name, { null: nil }
      t.text :description
      t.decimal :map_width
      t.decimal :map_height

      t.timestamps
    end
  end
end
