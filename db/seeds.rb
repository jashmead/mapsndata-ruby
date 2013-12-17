# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# production email will have to be different
mapsndata = User.create! ( 
  name: 'mapsndata',
  email: 'talk@johns-imac.home',
  password: 'Dr@g0n13',
  password_confirmation: 'Dr@g0n13'
)

home = Map.create! (
  user_id: mapsndata.id,
  name: 'home',
  description: 'Home map for maps & data',
  map_type: 'blank'
)

# populate home map with useful data, i.e. location of the rest of the system
