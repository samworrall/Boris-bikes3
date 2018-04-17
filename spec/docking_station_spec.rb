require 'docking_station'

describe DockingStation do
  docking_station = DockingStation.new
  it "should respond" do
    expect(docking_station).to respond_to(:release_bike)
  end
end
