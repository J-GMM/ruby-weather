class Snapshot < ApplicationRecord
  attr_accessor :high_c, :low_c, :temp_c, :wind_speed, :wind_dir,
  :weather_state, :predictability, :humidity, :high_f, :low_f, :temp_f,
  :location_id
  def initialize(response)
    @high_c = response['max_temp'].round(1)
    @low_c = response['min_temp'].round(1)
    @temp_c = response['the_temp'].round(1)
    @wind_speed = response['wind_speed']
    @wind_dir = response['wind_direction_compass']
    @weather_state = response['weather_state_name']
    @predictability = response['predictability']
    @humidity = response['humidity']

    # Default is in C, conversions to F
    @high_f = ((response['max_temp'] * (9/5)) + 32).round(1)
    @low_f = ((response['min_temp'] * (9/5)) + 32).round(1)
    @temp_f = ((response['the_temp'] * (9/5)) + 32).round(1)
  end # initialize
end
