json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :description, :url, :address, :longitude, :latitude
  json.url user_url(user, format: :json)
end
