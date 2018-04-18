require './lib/bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes docked at this station.' if @bikes == []
    @bikes
  end

  def dock_bike(bike)
    fail 'Docking station is at full capacity.' unless @bikes == []
    @bikes.push(bike)
  end
end
