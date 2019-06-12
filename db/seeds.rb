# name = stores.map{|store| store["name"]}
# location = stores.map{|store| store["location"]}
# id = stores.map{|store| store["id"]}
# address = stores.map{|store| store['location']["formattedAddress"].join(' ')}
# lat = stores.map{|store| store['location']["lat"]}
# lng = stores.map{|store| store['location']["lng"]}

url = 'https://api.foursquare.com/v2/venues/explore?client_id=OCIOZ2I1T2ESD2QM5Q1PDDRIET1AIS5YHPIHKY52CXXCVVRZ&client_secret=ZGCJSC5AEZLR1IJXLBWMEG0FBL4AIVKKA55UKUBRW30DEU0B&v=20180323&ll=40.7243,-74.0018&query=coffee&limit=50&offset=26'
response_string = RestClient.get(url)
response_hash = JSON.parse(response_string)

data = response_hash["response"]["groups"][0]["items"]
stores = data.map{|store| store["venue"]}
stores.map{|store| Store.create(name: store["name"], img_url: "not found", address: store['location']["formattedAddress"].join(' '), lng: store['location']["lng"], lat: store['location']["lat"])}
