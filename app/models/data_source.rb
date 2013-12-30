=begin
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

  -- could use a data_source type:
    point, url, map, table, chart (may need sub type), control
      that is the controls are worked by using data_sources with the correct type & properties
      -- could have a separate controls table, but that seems less elegant, somehow

  -- current assumption:  each data_source has only one map
    -- logical for getting started
    -- they are lightweight enough that this should not matter

  -- probably want a history version, done by triggers on the postgres side

  -- may want a data_links table:
    -- should never have a case where the two data_sources have different map ids; should check for this
    -- for use in various d3 node & arrow graphs
  create_table "data_links", force: true do |t|
    t.integer from_data_source_id
    t.integer to_data_source_id
    t.decimal value
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  -- may want a data_feeds table:
    as for the census bureau

=end

class DataSource < ActiveRecord::Base

  DS_TYPES = [ 'point', 'url', 'control', 'map', 'table', 'chart' ]

  validates :map_id, presence: true

  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }

  validates_inclusion_of :ds_type, :in => DS_TYPES

  belongs_to :map, inverse_of: :data_sources

  before_save do
    self.name = name.titleize
  end

end
