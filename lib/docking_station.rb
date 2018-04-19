require './lib/bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :broken_bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes docked at this station.' if (@bikes.empty? && @broken_bikes.empty?)
    fail 'No working bikes available.' if @bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail 'Docking station is at full capacity.' if full?
    bike.working ? @bikes.push(bike) : @broken_bikes.push(bike)
  end

  private

  def full?
    @bikes.count + @broken_bikes.count >= @capacity
  end
end
