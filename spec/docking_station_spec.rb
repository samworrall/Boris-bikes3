require 'docking_station'
require 'bike'

describe DockingStation do

  it {is_expected.to respond_to(:release_bike).with(0).argument}

  describe '#release_bike' do
    docking_station = DockingStation.new
    it "raises an error when there are no bikes docked" do
      expect{docking_station.release_bike}.to raise_error 'No bikes docked at this station.'
    end
    it "should get a bike when asked to release a bike" do
      bike = Bike.new
      docking_station.dock_bike(bike)
      expect(docking_station.release_bike.last).to be_instance_of(Bike)
    end
  end

  it {is_expected.to respond_to(:dock_bike).with(1).argument}

  describe '#dock_bike' do
    docking_station = DockingStation.new
    it "should allow bike to be docked" do
      docking_station.dock_bike(bike = Bike.new)
      expect(docking_station.bikes.last).to eq(bike)
    end
    it "raises an error when dock station capacity is full" do
      expect{docking_station.dock_bike(Bike.new)}.to raise_error 'Docking station is at full capacity.'
    end
  end

end
