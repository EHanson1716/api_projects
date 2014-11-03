require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.

url_safe_coords = "#{the_latitude},#{the_longitude}"

url_of_data_we_want = "https://api.forecast.io/forecast/52245a0741995b9edda435560ee2b885/#{url_safe_coords}"

raw_data=open(url_of_data_we_want).read
# puts raw_data.class
parsed_data=JSON.parse(raw_data)
# puts parsed_data.class
# puts parsed_data.keys

parsed_current_data = parsed_data['currently']
# puts parsed_current_data.keys

the_temperature = parsed_current_data['temperature']
# puts the_temperature

parsed_hourly_data = parsed_data['hourly']
# puts parsed_hourly_data.keys

the_hour_outlook = parsed_hourly_data['summary']

the_day_outlook = parsed_data['daily']['summary']
# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
