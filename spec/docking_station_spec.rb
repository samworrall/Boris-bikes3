require 'docking_station'
require 'bike'

describe DockingStation do
  DEFAULT_CAPACITY = 20
  it {is_expected.to respond_to(:release_bike).with(0).argument}

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

    let(:bike) { double :bike }
    let(:broken_bike) { double :broken_bike }

    it "raises an error when there are no bikes docked" do
      expect{subject.release_bike}.to raise_error 'No bikes docked at this station.'
    end

    it "should get a bike when asked to release a bike" do
      allow(bike).to receive(:working).and_return(true)
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it "raises an error when only broken bikes are available" do
      allow(broken_bike).to receive(:working).and_return(false)
      subject.dock_bike(broken_bike)
      expect{subject.release_bike}.to raise_error 'No working bikes available.'
    end

    it "returns a working bike even if broken bike was last one docked" do
      allow(bike).to receive(:working).and_return(true)
      allow(broken_bike).to receive(:working).and_return(false)
      subject.dock_bike(bike)
      subject.dock_bike(broken_bike)
      expect(subject.release_bike).to eq(bike)
    end

  end

  it {is_expected.to respond_to(:dock_bike).with(1).argument}

  describe '#dock_bike' do

    let(:bike) { double :bike }
    let(:broken_bike) { double :broken_bike }

    it "should allow a working bike to be docked" do
      allow(bike).to receive(:working).and_return(true)
      subject.dock_bike(bike)
      expect(subject.bikes.last).to eq(bike)
    end

    it "should allow a broken bike to be docked" do
      allow(broken_bike).to receive(:working).and_return(false)
      subject.dock_bike(broken_bike)
      expect(subject.broken_bikes.last).to eq(broken_bike)
    end

    it "raises an error when dock station capacity is full" do
      allow(bike).to receive(:working).and_return(true)
      allow(broken_bike).to receive(:working).and_return(false)
      half_capacity = DEFAULT_CAPACITY / 2
      half_capacity.times { subject.dock_bike(bike) }
      half_capacity.times { subject.dock_bike(broken_bike) }
      expect{subject.dock_bike(bike)}.to raise_error 'Docking station is at full capacity.'
    end

  end

end
