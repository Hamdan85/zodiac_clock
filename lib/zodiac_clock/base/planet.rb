# Planet class
class Planet
  attr_reader :planet, :symbol,	:connection, :signs, :latitude, :longitude

  def initialize(planet, latitude, longitude)
    @planet = planet.to_sym
    @latitude = latitude
    @longitude = longitude
    set_symbol
    set_connection
    set_sign
  end

  private

  def set_symbol
    @symbol = case @planet
                when :sun
                  '☉'
                when :moon
                  '☽︎'
                when :mercury
                  '☿'
                when :venus
                  '♀'
                when :mars
                  '♂'
                when :ceres
                  '⚳'
                when :jupiter
                  '♃'
                when :saturn
                  '♄'
                when :uranus
                  '⛢'
                when :neptune
                  '♆'
                when :pluto
                  '♇'
              end
  end

  def set_connection
    @connection = case planet
                    when :sun
                      :ancient
                    when :moon
                      :ancient
                    when :mercury
                      :ancient
                    when :venus
                      :ancient
                    when :mars
                      :ancient
                    when :ceres
                      :modern
                    when :jupiter
                      :ancient
                    when :saturn
                      :ancient
                    when :uranus
                      :modern
                    when :neptune
                      :modern
                    when :pluto
                      :modern
                  end
  end

  def set_sign
    @signs = case planet
               when :sun
                 [:lion]
               when :moon
                 [:cancer]
               when :mercury
                 [:gemini, :virgo]
               when :venus
                 [:taurus, :libra]
               when :mars
                 [:aries]
               when :ceres
                 []
               when :jupiter
                 [:sagittarius]
               when :saturn
                 [:capricornius]
               when :uranus
                 [:aquarius]
               when :neptune
                 [:pisces]
               when :pluto
                 [:scorpio]
             end
  end
end













