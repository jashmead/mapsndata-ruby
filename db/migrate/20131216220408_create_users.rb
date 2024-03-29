class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :description
      t.string :url
      t.string :address
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
