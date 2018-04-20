class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_broken_bikes(station)
    @bikes + station.broken_bikes
  end

end
