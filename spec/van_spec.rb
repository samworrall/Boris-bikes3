require 'van'

describe Van, :van do

  it 'responds to the method collect broken bikes' do
    expect(subject).to respond_to(:collect_broken_bikes)
  end


end
