require 'DockingStation'

describe DockingStation do

  it 'works - the whole thing' do
    20.times {subject.dock(Bike.new)}
    expect {subject.dock(Bike.new)}.to raise_error
  end


end
