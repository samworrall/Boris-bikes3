require 'bike'

describe Bike do

  it "Checks working is initialzed to true" do
    expect(subject.working).to eq true    
  end

  it "Set to be not working" do
    subject.working = false
    expect(subject.working).to eq false
  end

end
