require 'rest-client'
require 'json'
require 'swe4r'
require 'geocoder'
require_relative '../base/house'
require_relative '../base/planet'

# Class to calculates the ephemeris table
class Ephemeris

  attr_reader :body, :datetime, :body, :houses, :planets

  def initialize(location, datetime)
    @datetime   = datetime
    @planets    = {}
    @houses     = {}

    @jd          = Swe4r::swe_julday(datetime.year, datetime.month, datetime.day, time)
    @location    = Geocoder.search(location).first

    @latitude    = @location.latitude
    @longitude   = @location.longitude
    @altitude    = 1468


    # Set the geographic location for topocentric positions
    Swe4r::swe_set_topo(@longitude, @latitude, @altitude)

    # Set the sidereal mode for sidereal positions
    Swe4r::swe_set_sid_mode(Swe4r::SE_SIDM_LAHIRI, 0, 0)

    set_ayanamsha
    set_planets
    set_houses
  end

  # Calculate the position of the Astro
  # Use the Moshier Ephemeris (does not require ephemeris files)
  # Get high precision speed and sidereal/topocentric positions
  def set_planets
    target_planets.each do |planet|
      body = Swe4r.swe_calc_ut(@jd, Swe4r.const_get(planet), Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)

      name = planet.to_s.split('_').last.downcase.to_sym
      @planets[name] = {
          body: Planet.new(name, body[0], body[2]),
          distance_in_au: body[2],
          speed_in_longitude: body[3],
          speed_in_latitude: body[4],
          speed_in_distance: body[5],
          ayanamsha: @ayanamsha
      }
    end
  end

  def set_houses
    houses = Swe4r.swe_houses(@jd, @latitude, @longitude, 'P')
    (1..12).each do |i|
      house = House.new(i)
      @houses[house.title.downcase.to_sym] = {
          number: house.number,
          interpretation: house.interpretation,
          angle: houses[i]
      }
    end

    @houses[:ascendant] = houses[13]
    @houses[:midheaven_mc] = houses[14]
    @houses[:armc] = houses[15]
    @houses[:equatorial_ascendant] = houses[16]
    @houses[:koch_co_ascendant] = houses[17]
    @houses[:munkasey_co_ascendant] = houses[18]
    @houses[:polar_ascendant] = houses[19]
  end

  # Get the ayanamsha (the distance of the tropical vernal point from the sidereal zero point of the zodiac)
  def set_ayanamsha
    @ayanamsha = Swe4r::swe_get_ayanamsa_ut(@jd)
  end

  private

  def target_planets
    [
        "SE_SUN",
        "SE_MOON",
        "SE_MERCURY",
        "SE_VENUS",
        "SE_MARS",
        "SE_JUPITER",
        "SE_SATURN",
        "SE_URANUS",
        "SE_NEPTUNE",
        "SE_PLUTO"
    ]
  end

  def time
    (@datetime.hour.to_s + '.' + @datetime.min.to_s).to_f
  end
end
