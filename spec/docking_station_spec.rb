require 'DockingStation'
require 'Bike'

describe DockingStation do

    describe '#release_bike' do
          it { is_expected.to respond_to :release_bike }

          it 'gets a bike and expects to be working' do
          subject.dock Bike.new
          bike = subject.release_bike
          expect(bike).to be_working
          end

          it 'does not release broken bikes' do
            bike = Bike.new
            bike.report_broken
            subject.dock(bike)
            expect {subject.release_bike}.to raise_error
          end

      end

    describe '#empty?' do
        it 'raises exception when no bikes' do
          expect {subject.release_bike}.to raise_error
        end
    end

    describe '#dock' do
        it 'allows a bike to be docked' do
          bike = Bike.new
          subject.dock(bike)
          expect(subject.release_bike).to eq bike
        end

      end

    describe '#full?' do
        it 'raises an error if the dock is full' do
          subject.capacity.times {subject.dock(Bike.new)}
          expect {subject.dock(Bike.new)}.to raise_error 'Dock is already full'
        end
    end

    describe '#initialize' do
      it 'allows capacity to be set' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bike.new }
        expect { docking_station.dock Bike.new }.to raise_error
      end


      it 'it sets a default cacpacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
      end
end
