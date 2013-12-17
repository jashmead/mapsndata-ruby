class Map < ActiveRecord::Base

  # layout types basically from d3
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

  # not all map_types currently instantiated; will probably come up with more types in the future
  MAP_TYPES = [ 
    'blank',      # just an empty div, good for debugging & for getting started
    'tag_cloud',  # just put the names on a blank div or image
    'image',      # image background, image can be png, jpg, tiff, svg
    'leaflet',    # use leaflet to build
    'google',     # use google to build
    'svg',        # use svg (& probably d3) to build -- less passive take on image
    'custom',     # hand-hacked, may not be modifiable, likely to have custom js/css
    'frozen'      # no further edits permitted, may have custom css/js, has been dumped into some kind of fixed image + links format
  ]

  # canonicalize names using title2name, name2title below
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }

  validates_inclusion_of :map_type, :in => MAP_TYPES   

  validates :user_id, presence: true

  belongs_to :user, inverse_of: :maps

  # additional fields:
  #   map_width, map_height
  # gis fields:
  #   longitude, latitude -- of center one imagines
  # edit fields (to be added):
  #   edit_user_id -- maps to users, updated_at will give the edit time, assigned to current user, if in edit mode
  #   edit_comment -- text
  #   edit_checked_out_at -- optimistic locking datetime
  # file/image fields (to be added)

  private

    # use wikipedia algorithm to turn titles to names, call on save
    def title2name
      
    end

    # use wikipedia algorithm to turn names to titles, call on fetch
    def name2title

    end

end
