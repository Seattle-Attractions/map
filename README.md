# Seattle Attractions Map

## Description
Interactive map built using Rails and PostgreSQL of [Seattle's Premier Attractions](http://www.seattleattractions.com/) that can be viewed at: http://seattleattractionsmap.herokuapp.com/

The map includes:
* Markers on map for each attraction
* Optional markers for restaurants and parking for advertising revenue
* Information on each attraction, restaurant, or parking lot
* Ability to zoom to the location on the map when an attraction is selected in the sidebar
* Ability to filter by location to narrow down the list of attractions
* Ability for admins to add, edit or remove attractions, restaurants and parking lots
* Mobile view with different design and functionality including a way to find attractions near your current location

Relevent Gems:
* Google Maps for Rails
* Geocoder

## Set up
* Git clone
* `bundle install`
* `rake db:migrate`
* `foreman start` to start the server
* View at `http://localhost:3000`

## Authors

* [Deirdre Allison](https://github.com/DeirdreAllison)
* [Derek Maffett](https://github.com/DerekMaffett)
* [Pete Mitchell](https://github.com/petemmitchell)
