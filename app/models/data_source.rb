=begin
  -- could use a data_source type:
    url, map, chart (will need sub type), control
  create_table "data_sources", force: true do |t|
    t.integer  "map_id"
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "email"
    t.string   "contact_name"
    t.text     "address"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.decimal  "x_pos"
    t.decimal  "y_pos"
    t.decimal  "x_width"
    t.decimal  "y_width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
=end

class DataSource < ActiveRecord::Base

  validates :map_id, presence: true

  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }

  belongs_to :map, inverse_of: :data_sources

  before_save do
    self.name = name.titleize
  end

end
