require './lib/bike'

class DockingStation
  CAPACITY = 20
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes docked at this station.' if @bikes.empty?
    @bikes
  end

  def dock_bike(bike)
    fail 'Docking station is at full capacity.' if @bikes.count >= 20
    @bikes.push(bike)
  end
end
