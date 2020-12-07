require 'json'

module SnapshotHelper
  # use try/catch blocks to display a request failed page
  def get_json(url)
    json_object = JSON.parse(open(url).read)
  end

  def current_time(time_zone, weather_response)
    tz = ActiveSupport::TimeZone[time_zone].formatted_offset(false)
    return weather_response.to_datetime.change(:offset => tz).strftime("%m/%d/%Y %H:%M UTC")
  end

  def get_color(temp)
    if temp <= 20
      return 'under_20'
    end
    if temp <= 30
      return '20_30'
    end
    if temp <= 40
      return '30_40'
    end
    if temp <= 50
      return '40_50'
    end
    if temp <= 60
      return '50_60'
    end
    if temp <= 70
      return '60_70'
    end
    if temp <= 80
      return '70_80'
    end
    return '80_up'
    end
end
