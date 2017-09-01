class Degree
  attr_reader :degrees, :minutes, :seconds

  def initialize(degrees = 0, minutes = 0, seconds = 0)
    @seconds  = seconds % 60
    @minutes  = (minutes + seconds / 60) % 60

    pre_degree = (degrees + minutes / 60 + (minutes + seconds / 60))

    @degress  = if pre_degree > 360
                  pre_degree % 360
                else
                  pre_degree
                end
  end
end