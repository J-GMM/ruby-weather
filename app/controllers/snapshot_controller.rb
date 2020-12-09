require 'json'
require 'Socket'
require 'open-uri'

class SnapshotController < ApplicationController
  def index
    # API Requests
    locality_response = helpers.get_json("http://freegeoip.app/json/#{request.remote_ip}")
    where_on_earth = helpers.get_json(
      "https://www.metaweather.com/api/location/search/?lattlong=
    #{locality_response['latitude']},#{locality_response['longitude']}"
    )[0]['woeid']
    consolidated_weather = helpers.get_json(
      "https://www.metaweather.com/api/location/#{where_on_earth}")['consolidated_weather'][0]

    # Table setup
    @location = Location.new(:city => locality_response['city'],
                             :country => locality_response['country_code'],
                             :region => locality_response['region_name'])
    @snapshot = Snapshot.new(consolidated_weather)
    @snapshot.location_id = @location[:id]
    @retrieved_location = Location.find_by(@snapshot.location_id)

    # Display only
    @weather_icon = "https://www.metaweather.com/static/img/weather/#{consolidated_weather['weather_state_abbr']}.svg"
    @created_dt = consolidated_weather['created'].to_datetime.strftime("%m/%d/%Y %H:%M UTC")
    @display_class = helpers.get_color(@snapshot.temp_f)
  end # index
end
