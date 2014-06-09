require 'airport'
require 'aeroplane'

describe Airport do

	let(:airport) {Airport.new}
	let(:plane) {Aeroplane.new}

	context 'good weather' do

		context 'traffic control' do
			before(:each) do
				allow(airport).to receive(:good_weather?).and_return(true)
			end		

			it 'will be empty upon instantiation' do
				expect(airport.airport_plane_count?).to eq 0
			end

			it 'can have one aeroplane land' do
				plane.take_off!
				airport.land_plane!(plane)
				expect(airport.airport_plane_count?).to eq 1
				expect(plane).not_to be_flying
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
				expect(airport).to be_full
			end
	
			it 'cannot have 6 aeroplanes in it' do
				6.times{airport.land_plane!(plane)}
				expect(airport.airport_plane_count?).to eq 5
			end
		end

		context 'weather' do

			it 'will allow a plane to take off in good weather' do
				allow(airport).to receive(:good_weather?).and_return(true)
				airport.land_plane!(plane)
				airport.take_off!(plane)
				expect(airport.airport_plane_count?).to eq 0
				expect(plane).to be_flying
			end

			it 'will not allow a plane to take off in bad weather' do
				expect(airport).to receive(:good_weather?).and_return(true)
				airport.land_plane!(plane)
				expect(airport).to receive(:good_weather?).and_return(false)
				airport.take_off!(plane)
				expect(airport.airport_plane_count?).to eq 1
				expect(plane).not_to be_flying
			end

			it 'takes off the correct plane' do 
				allow(airport).to receive(:good_weather?).and_return(true)
				plane1 = Aeroplane.new
				plane2 = Aeroplane.new
				airport.land_plane!(plane1)
				airport.land_plane!(plane2)	
				airport.take_off!(plane1)
				expect(airport.airport_contents).to eq [plane2]
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





