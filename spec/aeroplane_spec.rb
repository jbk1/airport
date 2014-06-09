require 'aeroplane'
require 'airport'
require 'weather'


describe Aeroplane do 
	let(:aeroplane){Aeroplane.new }

	it 'is initially not flying' do
		expect(aeroplane).not_to be_flying
	end

	it 'is flying after take off' do
		aeroplane.take_off!
		expect(aeroplane).to be_flying
	end

	it 'can land' do
		aeroplane.take_off!
		aeroplane.land!
		expect(aeroplane).not_to be_flying
	end


end

