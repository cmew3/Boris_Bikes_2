require 'van'
require 'bike_container_spec'

describe Van do

	it_behaves_like 'a bike container'

	let (:van)                  { Van.new(:capacity => 100)                               	}
	let (:broken_bike)          { double :broken_bike,  broken?: true, instance_of?: true 	}
	let (:van_with_broken_bike) { Van.new(bikes: [broken_bike])                          	}
	let (:working_bike)         { double :working_bike, broken?: false, instance_of?: true	}
	let (:van_with_working_bike){ Van.new(bikes: [working_bike])                          	}

	it 'should allow setting deault capacity on initialising' do
		expect(van.capacity).to eq(100)
	end	

	context 'when moving bikes around' do

		it 'should pick up broken bikes from station' do
			station = double :station, broken_bikes: [broken_bike], release: :bike
			van.pick_up_broken_bikes(station)	
			expect(van.broken_bikes).to eq [broken_bike]
		end
	
		it 'should remove broken bikes from station' do
			station = double :station, broken_bikes: [broken_bike]
			expect(station).to receive(:release).with(broken_bike)
			van.pick_up_broken_bikes(station)
		end

		it 'should release broken bikes to garage' do
			garage = double :garage, dock: :bike
			van_with_broken_bike.release_broken_bikes(garage)	
			expect(van_with_broken_bike.broken_bikes).to eq []	
		end

		it 'should add broken bikes to the garage' do
			garage = double :garage	
			expect(garage).to receive(:dock).with(broken_bike)
			van_with_broken_bike.release_broken_bikes(garage)	
		end

		it 'should pick up working bikes from garage' do
		 	garage = double :garage, working_bikes: [working_bike], release: :bike
			van.pick_up_working_bikes(garage)	
			expect(van.working_bikes).to eq [working_bike]	
		end

		it 'should remove working bikes from garage' do
		 	garage = double :garage, working_bikes: [working_bike]
			expect(garage).to receive(:release).with(working_bike)
			van.pick_up_working_bikes(garage)	
		end

		it 'should release working bikes to docking stations' do
			station = double :station, dock: :bike
			van_with_working_bike.release_working_bikes(station)	
			expect(van_with_working_bike.working_bikes).to eq []
		end
		
		it 'should dock working bikes to docking stations' do
			station = double :station
			expect(station).to receive(:dock).with(working_bike)
			van_with_working_bike.release_working_bikes(station)	
		end
	end
end