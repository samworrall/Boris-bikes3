require 'van'
require 'docking_station'
require 'bike'

describe Van, :van do

  it 'responds to the method collect broken bikes' do
    expect(subject).to respond_to(:collect_broken_bikes)
  end

describe '#collect_broken_bikes' do
  it 'returns array of broken bikes' do
    station = DockingStation.new
    bike = Bike.new(working = false)
    station.dock_bike(bike)
    expect(subject.collect_broken_bikes(station)).to eq station.broken_bikes
  end
end

end