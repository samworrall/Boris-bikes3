require 'docking_station'
require 'bike'

describe DockingStation do
  docking_station = DockingStation.new
  bike = Bike.new
  it "should respond" do
    expect(docking_station).to respond_to(:release_bike)
  end
  it "should get a bike when asked to release_bike" do
    expect(docking_station.release_bike).to be_instance_of(Bike)
  end
  it "should expect the bike to be working" do
    expect(bike).to be_working
  end

  it "should dock bike to a docking station" do
    expect(docking_station).to respond_to(:dock_bike).with(1).argument
  end

  it "should allow bike to be docked" do
    docking_station.dock_bike(bike)
    expect(docking_station).to have_attributes(:bike => bike)
  end

end
