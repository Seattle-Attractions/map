ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  unless table == 'schema_migrations'
    ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
  end
end

Admin.create!([
  {email: "seattle@email.com", password: "password", password_confirmation: 'password'}
])

locations = Location.create!([
  {name: "Downtown Seattle"},
  {name: "Northgate"},
  {name: "Mercer Island"},
  {name: "Kirkland"}
])

Attraction.create!([
  {name: "Space Needle", address: "400 Broad St, Seattle, WA 98109",
    latitude: 47.6204, longitude: -122.3491, description: "The Space Needle is a
    big tower!", website: "http://www.spaceneedle.com", location_id:
    locations[0].id, icon_url: "1.jpg"},
  {name: "Seattle Public Library", address: "1000 4th Ave Seattle, WA 98104",
    latitude: 47.6066, longitude: -122.332984, description: "Seattle Public
    Library is a great place to check out books!", website:
    "http://www.seattlepubliclibrary.com", location_id: locations[2].id},
  {name: "Underground Tour", address: "608 1st Ave Seattle, WA 98104",
    latitude: 47.602320, longitude: -122.333602, description: "Toilets,
    Treachery & Prostitutes", website: "http://www.undergroundtour.com",
    location_id: locations[1].id},
  {name: "Kenmore Air", address: "950 Westlake Ave N Seattle, WA 98109",
    latitude: 47.628839, longitude: -122.339740, description: "Fly to the
    gorgeous San Juans!", website: "http://www.kenmoreair.com",
    location_id: locations[3].id}
])
ParkingLot.create!([
  {name: "Market Place Garage", address: "65 Lenora St Seattle, WA 98101",
    latitude: 47.611691, longitude: -122.344123, hours: "5am-12am", rates:
    "$65/hr"},
  {name: "Union Square Garage", address: "601 Union St Seattle, WA 98101",
    latitude: 47.610176, longitude: -122.331969, hours: "6am-10pm", rates:
    "More than you can afford"}
])
Restaurant.create!([
  {name: "Canlis", address: "2576 Aurora Ave N Seattle, WA 98109",
    latitude: 47.643165, longitude: -122.346775, phone: "(206) 283-3313",
    website: "http://www.canlis.com", price: "$$$$"},
  {name: "AQUA by El Gaucho", address: "2801 Alaskan Way Seattle, WA 98121",
    latitude: 47.616253, longitude: -122.356131, phone: "(206) 956-9171",
    website: "http://www.elgaucho.com", price: "$$$"}
])

