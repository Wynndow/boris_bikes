require 'DockingStation'

describe DockingStation do

    describe '#release_bike' do
          it { is_expected.to respond_to :release_bike }

          it 'gets a bike and expects to be working' do
            bike = Bike.new
            subject.dock(bike)
            expect(bike).to be_working
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
      capacity = 20
        expect {DockingStation.new(capacity)}.not_to raise_error
      end


      it 'it sets a default cacpacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
      end
end
