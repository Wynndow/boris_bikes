require_relative '../lib/Bike.rb'

class DockingStation

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available!' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Dock is already full' if @bikes.length >= 20
    @bikes << bike
  end

end
