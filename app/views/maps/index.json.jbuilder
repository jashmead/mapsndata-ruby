json.array!(@maps) do |map|
  json.extract! map, :id, :user_id, :map_type, :name, :description, :map_width, :map_height
  json.url map_url(map, format: :json)
end
