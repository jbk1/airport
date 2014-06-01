require 'aeroplane'
require 'airport'
require 'weather'


describe Aeroplane do 

include Weather

	it 'is initially not flying' do
		aeroplane = Aeroplane.new 
		expect(aeroplane).not_to be_flying
	end

	it 'has not taken off' do
		aeroplane = Aeroplane.new
		Airport.take_off_allowed? == false
		expect(aeroplane.taken_off?).not_to be_true
	end

	# it 'has the ability to fly' do
	# aeroplane = Aeroplane.new
	# expect(aeroplane).to be_flying
	# end

end

