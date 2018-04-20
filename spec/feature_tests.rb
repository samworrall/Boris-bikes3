
def collecting_broken_bikes
  station = DockingStation.new
  bike = Bike.new(working = false)
  station.dock_bike(bike)
  van = Van.new
  van.collect_broken_bikes(station)
end
