require_relative '../lib/Bike.rb'

class DockingStation

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available!' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Dock is already full' if full?
    @bikes << bike
  end

private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= 20
  end

end
