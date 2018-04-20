require 'docking_station'
require 'bike'

describe DockingStation do
  let(:bike) { double :bike, working: true }
  let(:broken_bike) { double :broken_bike, working: false }
  DEFAULT_CAPACITY = 20

  describe '#initialize' do
    it "allows user to set @capacity when initializing" do
      new_capacity = 3
      station = DockingStation.new(new_capacity)
      expect(station.capacity).to eq(new_capacity)
    end

    it "ensure @capacity is set to default when no parameters are passed" do
      station = DockingStation.new
      expect(station.capacity).to eq(DEFAULT_CAPACITY)
    end
  end

  describe '#release_bike' do

    it "raises an error when there are no bikes docked" do
      expect{subject.release_bike}.to raise_error 'No bikes docked at this station.'
    end

    it "should get a bike when asked to release a bike" do
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it "raises an error when only broken bikes are available" do
      subject.dock_bike(broken_bike)
      expect{subject.release_bike}.to raise_error 'No working bikes available.'
    end

    it "returns a working bike even if broken bike was last one docked" do
      subject.dock_bike(bike)
      subject.dock_bike(broken_bike)
      expect(subject.release_bike).to eq(bike)
    end

  end

  describe '#dock_bike' do

    it "should allow a both working bike and broken bike to be docked" do
      subject.dock_bike(bike)
      subject.dock_bike(broken_bike)
      expect([subject.bikes.last, subject.broken_bikes.last]).to eq([bike, broken_bike])
    end


    it "raises an error when dock station capacity is full" do
      half_capacity = DEFAULT_CAPACITY / 2
      half_capacity.times { subject.dock_bike(bike) }
      half_capacity.times { subject.dock_bike(broken_bike) }
      expect{subject.dock_bike(bike)}.to raise_error 'Docking station is at full capacity.'
    end

  end

end
