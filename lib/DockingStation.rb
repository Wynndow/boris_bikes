require_relative '../lib/Bike.rb'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity

  end

  def release_bike
    fail 'No bikes available!' if empty?
    fail 'Bike is broken' if bikes.last.broken?
    bikes.pop
  end

  def dock(bike)
    fail 'Dock is already full' if full?
    bikes << bike
  end



private

attr_accessor :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end

end
