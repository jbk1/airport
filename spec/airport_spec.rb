require 'airport'
require 'aeroplane'

describe Airport do

		let(:airport) {Airport.new}
		let(:plane) {Aeroplane.new}

	context 'good weather' do
		before(:each) do
			allow(airport).to receive(:good_weather?).and_return(true)
		end

		context 'traffic control' do
			
			it 'will be empty upon instantiation' do
				expect(airport.airport_plane_count?).to eq 0
			end

			it 'can have one aeroplane land' do
				airport.land_plane!(plane)
				expect(airport.airport_plane_count?).to eq 1
			end

			it 'can have 5 aeroplanes in gates' do
				5.times{airport.land_plane!(plane)}
				expect(airport.airport_plane_count?).to eq 5
			end

			it 'has a maximum capacity of 5' do
				expect(airport.capacity).to eq 5
			end

			it 'knows when it is full' do
				5.times{airport.land_plane!(plane)}
				expect(airport.full?).to eq true
			end
	
			it 'cannot have 6 aeroplanes in it' do
				6.times{airport.land_plane!(plane)}
				expect(airport.airport_plane_count?).to eq 5
			end

			xit 'will allow a plane to take off in good weather' do
				airport.take_off_plane!
				expect(plane.flying?).to be_true

				# expect plane to receive taken_off
				# expect @airport contects to be less one plane

			end



		end
	end

# 	=========================

	context "airport's function with weather" do

		it "won't allow a plane to land if weather is bad" do
			allow(airport).to receive(:good_weather?).and_return(false)
			airport.land_plane!(plane)
			expect(airport.airport_plane_count?).to eq 0
		end
	end

end





