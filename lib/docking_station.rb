require './lib/bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes docked at this station.' if @bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail 'Docking station is at full capacity.' if full?
    @bikes.push(bike)
  end

  private

  def full?
    @bikes.count >= @capacity
  end
end
