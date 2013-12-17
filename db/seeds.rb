# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# production email will have to be different

# not using 'create!' as there is no harm in building the users, maps 2x
mapsndata_user = User.create( 
  name: 'mapsndata',
  email: 'mapsndata@mapsndata.com',
  password: 'Dr@g0n13',
  password_confirmation: 'Dr@g0n13'
)

mapsndata_developer = User.create( 
  name: 'jashmead',
  email: 'john.ashmead@mapsndata.com',
  password: 'Dr@g0n13',
  password_confirmation: 'Dr@g0n13'
)

home_map = Map.create(
  user_id: mapsndata_user.id,
  name: 'home',
  description: 'Home map for Maps & Data',
  map_type: 'blank'
)

help_map = Map.create(
  user_id: mapsndata_user.id,
  name: 'help',
  description: 'Home map for Maps & Data',
  map_type: 'blank'
)

site_map = Map.create(
  user_id: mapsndata_user.id,
  name: 'sitemap',
  description: 'Site Map for Maps & Data',
  map_type: 'blank'
)

# populate home map with useful data, i.e. location of the rest of the system
