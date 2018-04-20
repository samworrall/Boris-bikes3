class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_broken_bikes(station)
    fail "There are no broken bikes to collect" if station.broken_bikes.empty?
    @bikes + station.broken_bikes
    station.broken_bikes = []
  end
end
