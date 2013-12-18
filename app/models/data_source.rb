class DataSource < ActiveRecord::Base

  validates :map_id, presence: true

  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }

  belongs_to :map, inverse_of: :data_sources

  before_save do
    self.name = name.titleize
  end

end
