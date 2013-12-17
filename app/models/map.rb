class Map < ActiveRecord::Base

  # not all map_types currently instantiated; will probably come up with more types in the future
  MAP_TYPES = [ 
    'blank',      # just an empty div, good for debugging
    'tag_cloud',  # just put the names on a blank div or image
    'image',      # image background, image can be png, jpg, tiff, svg
    'leaflet',    # use leaflet to build
    'google',     # use google to build
    'svg',        # use svg (& probably d3) to build -- less passive take on image
    'custom',     # hand-hacked, may not be modifiable, likely to have custom js/css
    'frozen'      # no further edits permitted, may have custom css/js
  ]

  # canonicalize names using title2name, name2title below
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }

  validates_inclusion_of :map_type, :in => MAP_TYPES   

  validates :user_id, presence: true

  belongs_to :user, inverse_of: :maps

  private

    # use wikipedia algorithm to turn titles to names, call on save
    def title2name
      
    end

    # use wikipedia algorithm to turn names to titles, call on fetch
    def name2title

    end

end
