require './lib/docking_station.rb'
require './lib/bike.rb'
require './lib/van.rb'

def collecting_broken_bikes
  station = DockingStation.new
  bike = Bike.new(working = false)
  station.dock_bike(bike)
  van = Van.new
  van.collect_broken_bikes(station)
end

def drop_off_broken_bikes
  van = Van.new
  bike = Bike.new(working = false)
  van.bikes << bike
  van.drop_off_broken_bikes(garage)
end

def collect_repaired_bikes
  van = Van.new
  bike = Bike.new(working = true)
  van.collect_broken_bikes(garage)
end

def distribute_repaired_bikes
  van = Van.new
  bike = Bike.new(working = true)
  station = DockingStation.new
  van.bikes << bike
  van.distribute_repaired_bikes(station)
end
