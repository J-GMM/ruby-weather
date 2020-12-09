require 'json'
require 'open-uri'

module SnapshotHelper
  def get_json(url)
    json_object = JSON.parse(open(url).read)
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
