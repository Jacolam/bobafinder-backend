require 'rest-client'

# name = stores.map{|store| store["name"]}
# location = stores.map{|store| store["location"]}
# id = stores.map{|store| store["id"]}
# address = stores.map{|store| store['location']["formattedAddress"].join(' ')}
# lat = stores.map{|store| store['location']["lat"]}
# lng = stores.map{|store| store['location']["lng"]}

init_url = 'https://api.foursquare.com/v2/venues/explore?client_id=OCIOZ2I1T2ESD2QM5Q1PDDRIET1AIS5YHPIHKY52CXXCVVRZ&client_secret=ZGCJSC5AEZLR1IJXLBWMEG0FBL4AIVKKA55UKUBRW30DEU0B&v=20180323&ll=40.713579,-73.882671&query=bubble%20tea&limit=50&radius=16000'


def save_store_data(url)
# FETCHING THE DATA
response_string = RestClient.get(url)
response_hash = JSON.parse(response_string)
# setting limit for while loop
# adding 50 allows us to include any remainders 
length = response_hash['response']["totalResults"] + 50



counter = 0

while counter < length

  url = "https://api.foursquare.com/v2/venues/explore?client_id=OCIOZ2I1T2ESD2QM5Q1PDDRIET1AIS5YHPIHKY52CXXCVVRZ&client_secret=ZGCJSC5AEZLR1IJXLBWMEG0FBL4AIVKKA55UKUBRW30DEU0B&v=20180323&ll=40.713579,-73.882671&query=bubble%20tea&limit=50&radius=16000&offset=#{counter}"

  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)

  data = response_hash["response"]["groups"][0]["items"]
  stores = data.map{|store| store["venue"]}
  stores.map{|store| Store.create(name: store["name"], img_url: "not found", address: store['location']["formattedAddress"].join(' '), lng: store['location']["lng"], lat: store['location']["lat"])}

  counter += 50

end
# # CREATING DATA INTO THE DATABASE
#
end

save_store_data(init_url)
