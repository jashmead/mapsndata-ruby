class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :name, :unique => true, :null => nil
      t.string :title, :null => nil
      t.text :description, :null => nil

      t.timestamps
    end
  end
end
