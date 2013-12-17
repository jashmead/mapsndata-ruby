json.array!(@data_sources) do |data_source|
  json.extract! data_source, :id, :map_id, :name, :description, :url, :email, :contact_name, :address, :longitude, :latitude, :x_pos, :y_pos, :x_width, :y_width
  json.url data_source_url(data_source, format: :json)
end
