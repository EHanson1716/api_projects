require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "What is the address you would like to find the latitude and longitude of?"

# Gets a string from the user and chomps off the carriage return at the end
the_address = gets.chomp

# Replaces spaces and other URL-illegal characters in the string
url_safe_address = URI.encode(the_address)

# Your code goes below. Hints:

url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_address}"
raw_data = open(url_of_data_we_want).read
# puts raw_data
parsed_data =JSON.parse(raw_data)
# puts parsed_data
# puts parsed_data.class
# puts parsed_data.keys
# puts parsed_data["results"]
# puts parsed_data["results"].class
first = parsed_data["results"][0]
# puts first.class
# puts first.keys
geometry = first['geometry']
# puts geometry
coords = geometry['location']
# puts coords

# ...

# Let's store the latitude in a variable called 'the_latitude',
#   and the longitude in a variable called 'the_longitude'.

the_latitude = coords['lat']
the_longitude = coords['lng']

# Ultimately, we want the following line to work when uncommented:

puts "The latitude of #{the_address} is #{the_latitude} and the longitude is #{the_longitude}."
