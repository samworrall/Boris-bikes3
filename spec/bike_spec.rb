require 'bike'

describe Bike do
  bike = Bike.new
  it "Should respond to working? method" do
    expect(bike).to respond_to(:working?)
  end
end
