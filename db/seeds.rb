ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  unless table == 'schema_migrations'
    ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
  end
end

Admin.create!([
  {email: "seattle@email.com", password: "password", password_confirmation: 'password'}
])
Attraction.create!([
  {name: "Space Needle", address: "400 Broad St, Seattle, WA 98109", latitude: 47.6204, longitude: -122.3491, description: "The Space Needle is a big tower!", website: "http://www.spaceneedle.com", location: "Downtown Seattle"},
  {name: "Seattle Public Library", address: "1000 4th Ave Seattle, WA 98104", latitude: 47.6066, longitude: -122.332984, description: "Seattle Public Library is a great place to check out books!", website: "http://www.seattlepubliclibrary.com", location: "Downtown Seattle"}
])
