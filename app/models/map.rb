=begin
  -- may need a map sub type as well
  create_table "maps", force: true do |t|
    t.integer  "user_id"
    t.string   "map_type",            default: "blank"
    t.string   "name"
    t.text     "description"
    t.decimal  "map_width"
    t.decimal  "map_height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.decimal  "map_x"
    t.decimal  "map_y"
  end

  -- probably want a history version, done by triggers on the postgres side
  -- additional fields
    -- map_frozen
    -- map_self_contained

=end

class Map < ActiveRecord::Base

  # I'm a bit concerned, now that I think about it, that the term 'map' may confuse Ruby, which is found of it
  #   -- no indication of problems so far, and would really hate to change the name to something silly,
  #   -- like karte or kort or chart or somesuch...

  # not all map_types currently instantiated; will probably come up with more types in the future
  # main types are blank for debugging & leaflet for most real work
  MAP_TYPES = [ 
    'blank',      # just an empty div, good for debugging & for getting started
    'tag_cloud',  # just put the names on a blank div or image
    'image',      # image of map, usual image formats
    'leaflet',    # use leaflet to build
    'google',     # use google to build
    'd3',         # use svg (& probably d3) to build -- less passive take on image
    'custom'     # hand-hacked, may not be modifiable, likely to have custom js/css
  ]

  # layout types basically from d3
  #   -- in principle, other map types could have layout types, i.e. url for leaflet
  LAYOUT_TYPES = [
    'blank',    	# not from d3, needs x & y positions for each element, will place a title & url there,
                  #   -- can be on top of an image of some kind & in fact, this is best
                  #   -- starting point for tiled as in leaflet or google
    'bundle',   	# every node has a parent, every link has a source & target node
    'chord',    	# matrix of relationships
    'cluster',  	# links (parent/child)
    'force',    	# 'geometric' forces; have to experiment with this
    'hierarchy',  # parent & value for each node
    'histogram',  # values to be binned
    'pack',       # parent & value for each node
    'partition',  # parent & value for each node
    'pie',      	# needs an array of values
    'stack',    	# needs x-position & y-value for each element
    'tree',     	# needs a bunch of parent/child links
    'treemap'   	# needs parent/child links & value for each node
  ]

  # canonicalize names using title2name, name2title below
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }

  validates_inclusion_of :map_type, :in => MAP_TYPES   

  validates :user_id, presence: true

  belongs_to :user, inverse_of: :maps

  has_many :data_sources, inverse_of: :map, dependent: :destroy

  # additional fields:
  #   map_width, map_height
  # gis fields:
  #   longitude, latitude -- of center one imagines
  # edit fields (to be added):
  #   edit_user_id -- maps to users, updated_at will give the edit time, assigned to current user, if in edit mode
  #   edit_comment -- text
  #   edit_checked_out_at -- optimistic locking datetime
  #   cloned_from_id -- id of map this was cloned from
  # file/image fields (to be added)

  # OK, there is probably a better word than avatar...
  has_attached_file :avatar, 
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :styles => { :medium => "640x480#", :thumb => "64x64#", 
      :default_url => "/images/:style/empty_map.png" }

  before_save do
    self.name = name.titleize
  end

end
