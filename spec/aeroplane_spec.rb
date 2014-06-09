require 'aeroplane'
require 'airport'
require 'weather'


describe Aeroplane do 

include Weather

	it 'is initially not flying' do
		aeroplane = Aeroplane.new 
		expect(aeroplane).not_to be_flying
	end

	it 'is flying after take off' do
		aeroplane = Aeroplane.new 
		aeroplane.taken_off!
		expect(aeroplane).to be_flying
	end

	it 'has not taken off' do
		plane = Aeroplane.new
		airport = Airport.new
		airport.take_off_allowed?(plane) == false
		expect(plane.flying?).not_to be_true
	end

end

