def get_city_info(city_name)
  url = 'https://api.foursquare.com/v2/venues/explore?client_id=OCIOZ2I1T2ESD2QM5Q1PDDRIET1AIS5YHPIHKY52CXXCVVRZ&client_secret=ZGCJSC5AEZLR1IJXLBWMEG0FBL4AIVKKA55UKUBRW30DEU0B&v=20180323&ll=40.7243,-74.0018&query=coffee&limit=50'
  response_string = RestClient.get(url)

  # initial search result for the stores
  response_hash = JSON.parse(response_string)
  byebug
  # city_url = response_hash["_embedded"]["city:search-results"][0]["_links"]["city:item"]["href"]
  # 
  # stores = response_hash["data"]["response"]["groups"][0]["items"]
  # data.response.groups[0].items

  # getting basic city information in hash form
  # new_response_string = RestClient.get(city_url)
  # new_response_hash = JSON.parse(new_response_string)
end
