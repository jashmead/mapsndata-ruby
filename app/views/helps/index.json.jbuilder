json.array!(@helps) do |help|
  json.extract! help, :id, :name, :title, :description
  json.url help_url(help, format: :json)
end
