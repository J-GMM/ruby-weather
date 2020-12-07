require 'json'
require 'Socket'
require 'open-uri'
# ip = Socket::getaddrinfo(Socket.gethostname,"echo",Socket::AF_INET)[0][3]
ip = '69.113.151.238'
locality_response = JSON.parse(
  open(
    'http://freegeoip.app/json/'+ip
  ).read
)
lat = locality_response['latitude']
lon = locality_response['longitude']

woeid = JSON.parse(
  open(
    "https://www.metaweather.com/api/location/search/?lattlong=#{lat},#{lon}"
  ).read
)[0]['woeid']

weather_data = JSON.parse(
  open(
    "https://www.metaweather.com/api/location/#{woeid}"
  ).read
)
weather_data['consolidated_weather'][0].each do |key, value|
  puts "#{key}, #{value}"
end
