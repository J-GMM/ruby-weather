require 'json'
require 'Socket'
require 'open-uri'

class SnapshotController < ApplicationController
  def index
    # API Requests
    # use try/catch blocks to display a request failed page
    ip = open('http://whatismyip.akamai.com').read
    locality_response = helpers.get_json("http://freegeoip.app/json/#{ip}")
    where_on_earth = helpers.get_json(
      "https://www.metaweather.com/api/location/search/?lattlong=
    #{locality_response['latitude']},#{locality_response['longitude']}"
    )[0]['woeid']
    consolidated_weather = helpers.get_json(
      "https://www.metaweather.com/api/location/#{where_on_earth}")['consolidated_weather'][0]

    # Location data for display
    @snapshot = Snapshot.new(snapshot_params)
    @snapshot.city = locality_response['city']
    @snapshot.region = locality_response['region_name']
    @snapshot.country = locality_response['country_code']

    # Weather data
    @snapshot.high_c = consolidated_weather['max_temp'].round(1)
    @snapshot.low_c = consolidated_weather['min_temp'].round(1)
    @snapshot.temp_c = consolidated_weather['the_temp'].round(1)
    @snapshot.wind_speed = consolidated_weather['wind_speed']
    @snapshot.wind_dir = consolidated_weather['wind_direction_compass']
    @snapshot.weather_state = consolidated_weather['weather_state_name']
    @snapshot.predictability = consolidated_weather['predictability']
    @snapshot.humidity = consolidated_weather['humidity']

    # Default is in C, conversions to F
    @snapshot.high_f = ((consolidated_weather['max_temp'] * (9/5)) + 32).round(1)
    @snapshot.low_f = ((consolidated_weather['min_temp'] * (9/5)) + 32).round(1)
    @snapshot.temp_f = ((consolidated_weather['the_temp'] * (9/5)) + 32).round(1)

    # Display only
    @weather_icon = "https://www.metaweather.com/static/img/weather/#{consolidated_weather['weather_state_abbr']}.svg"
    @created_dt = helpers.current_time(locality_response['time_zone'],
      consolidated_weather['created'])

    @display_class = helpers.get_color(@snapshot.temp_f)
    # dt = DateTime.strptime(consolidated_weather['created'].truncate(9), '%Y-%m-%dT%H:%M:%S')
  end # index

  private
  def snapshot_params
    params.permit(:data)
  end # snapshot_params
end
