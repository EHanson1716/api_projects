require 'open-uri'
require 'json'


# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

# Your code goes below.

url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_address}"
raw_data = open(url_of_data_we_want).read
parsed_data =JSON.parse(raw_data)
coords = parsed_data['results'][0]['geometry']['location']
# puts coords

# # ...

# # Let's store the latitude in a variable called 'the_latitude',
# #   and the longitude in a variable called 'the_longitude'.

the_latitude = coords['lat']
the_longitude = coords['lng']

url_safe_coords = "#{the_latitude},#{the_longitude}"

url_of_coords_we_want = "https://api.forecast.io/forecast/52245a0741995b9edda435560ee2b885/#{url_safe_coords}"

raw_data=open(url_of_coords_we_want).read
parsed_data=JSON.parse(raw_data)
parsed_current_data = parsed_data['currently']
the_temperature = parsed_current_data['temperature']
parsed_hourly_data = parsed_data['hourly']
the_hour_outlook = parsed_hourly_data['summary']
the_day_outlook = parsed_data['daily']['summary']

# # Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
