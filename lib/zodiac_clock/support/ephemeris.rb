require 'rest-client'
require 'json'

class Ephemeris

  attr_reader :body, :date, :type, :unit
  attr_reader :x, :y, :z

  BASE_URL = 'http://www.astro-phys.com/api'
  def initialize(body, date, type = 'polynomial', unit = 'km')
    @body = body
    @date = date
    @type = type
    @unit = unit
  end

  def states
    url = BASE_URL + '/de406/states?'

    payload = {
        date: date,
        bodies: body,
        unit: unit,
        type: type
    }

    payload.each do |key, value|
      url << "#{key}=#{value}&"
    end

    response = begin
      JSON.parse((RestClient.get url, payload).body)
    rescue => e
      e
    end
    
    @x = response["results"][body][0][0]
    @y = response["results"][body][0][1]
    @z = response["results"][body][0][2]
  end
end
