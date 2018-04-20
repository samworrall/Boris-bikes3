require 'van'
require 'docking_station'
require 'bike'

describe Van, :van do
let(:broken_bike) {double :broken_bike, working: false}
let(:station) {instance_double DockingStation, dock_bike: [broken_bike], broken_bikes: [broken_bike]}
  it 'responds to the method collect broken bikes' do
    expect(subject).to respond_to(:collect_broken_bikes)
  end

  describe '#collect_broken_bikes' do
    it 'returns array of broken bikes' do
      station.dock_bike(broken_bike)
      expect(subject.collect_broken_bikes(station)).to eq station.broken_bikes
    end

    it 'raises an error when there are no broken bikes to collect' do
      station.dock_bike(broken_bike)
      subject.collect_broken_bikes(station)
      expect{subject.collect_broken_bikes(station)}.to raise_error "There are no broken bikes to collect"
    end
  end
end
