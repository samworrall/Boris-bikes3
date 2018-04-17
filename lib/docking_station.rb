require './lib/bike'

class DockingStation
  attr_accessor :bike
  def release_bike
    bike = Bike.new
  end

  def dock_bike(bike)
    @bike = bike
  end
end
