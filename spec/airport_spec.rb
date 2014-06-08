require 'airport'

describe Airport do

		let(:airport) {Airport.new}
		let(:plane) {Aeroplane.new}

	context 'taking off and landing' do
		
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
			expect(airport.capacity?).to eq 5
		end

		it 'knows when it is full' do
			5.times{airport.land_plane!(plane)}
			expect(airport.full?).to eq true
		end


		it 'cannot have 6 aeroplanes in it' do
			6.times{airport.land_plane!(plane)}
			expect(airport.airport_plane_count?).to eq 5
		end

		it 'can have good weather' do
			allow(airport).to receive(:good_weather?).and_return(true)
			expect(airport.good_weather?).to eq true
		end
# a) is this the right way to go about implementing weather here and b) how do you test that a random sample is giving out random results, where here it's just a mock returning a result?
		it 'can have bad weather' do
			allow(airport).to receive(:good_weather?).and_return(false)
			expect(airport.good_weather?).to eq false
		end

		xit 'won\'t allow a plane to land if weather is bad' do
			allow(airport).to receive(:good_weather?).and_return(false)
			expect(airport.land_plane!(plane)).to eq 'bad weather land elsewhere'
		end



	# context 'an airport has good or bad weather' do

	# 	it 'to be initalized with good weather' do
	# 		airport = Airport.new
	# 		expect(airport.weather?).to eq good
	# 	end
	# end
	end
end





