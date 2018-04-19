require 'docking_station'
require 'bike'

describe DockingStation do

  it {is_expected.to respond_to(:release_bike).with(0).argument}

  describe '#release_bike' do

    it "raises an error when there are no bikes docked" do
      expect{subject.release_bike}.to raise_error 'No bikes docked at this station.'
    end
    it "should get a bike when asked to release a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike.last).to be_instance_of(Bike)
    end
  end

  it {is_expected.to respond_to(:dock_bike).with(1).argument}

  describe '#dock_bike' do

    it "should allow bike to be docked" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.bikes.last).to eq(bike)
    end

    it "raises an error when dock station capacity is full" do
      CAPACITY = 20
      CAPACITY.times { subject.dock_bike(Bike.new) }
      expect{subject.dock_bike(Bike.new)}.to raise_error 'Docking station is at full capacity.'
    end

  end

end
