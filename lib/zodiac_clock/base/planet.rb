require 'time'
require '../../../lib/zodiac_clock/support/degree'

class Planet
  attr_reader :planet, :symbol, :roman_deide, :greek_god, :hindu_god,	:connection, :european_meaning,
              :vedic_meaning, :position, :hour, :minute, :fraction, :proportion

  def initialize(planet, symbol, roman_deide, greek_god, hindu_god, connection, european_meaning, vedic_meaning, birthdate)
    @planet               = planet
    @symbol               = symbol
    @roman_deide          = roman_deide
    @greek_god            = greek_god
    @hindu_god            = hindu_god
    @connection           = connection
    @european_meaning     = european_meaning
    @vedic_meaning        = vedic_meaning
    @year                 = birthdate.year
    @month                = birthdate.month
    @day                  = birthdate.day
    @hour                 = birthdate.hour
    @minute               = birthdate.minute

    perform
  end

  def perform
    superior_limit  = Degree.new()
    inferior_limit  = Degree.new()

    @fraction       = (@hour + @minute.to_f / 60) / 24

    @difference_arc = Degree.new(
        superior_limit.degrees - inferior_limit.degrees,
        superior_limit.minutes - inferior_limit.minutes,
        superior_limit.seconds - inferior_limit.seconds
    )

    @proportion = Degree.new(
        @fraction * @difference_arc.degrees,
        @fraction * @difference_arc.minutes,
        @fraction * @difference_arc.seconds
    )

    @position = Degree.new(
                          inferior_limit.degrees + @difference_arc.degrees,
                          inferior_limit.minutes + @difference_arc.minutes,
                          inferior_limit.seconds + @difference_arc.seconds
    )
  end
end