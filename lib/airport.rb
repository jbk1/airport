require 'aeroplane'
require 'weather'

class Airport
	include Weather

	DEFAULT_CAPACITY = 5
	
  attr_reader :airport_contents

	def initialize
		@airport_contents ||= []
	end

	def airport_plane_count?
		@airport_contents.count
	end

	def land_plane!(plane)
		
		if airport_plane_count? >= capacity
  		'bravo tango one niner, gate capacity reached, divert elsewhere, over'
  	elsif good_weather? == false
  		'weather conditions poor, permission to land denied, divert elsewhere, over'
    else 
    	plane.land!
    	@airport_contents << plane
  	end	
	end

	def take_off!(plane)
		if good_weather?
				airport_contents.delete plane
				plane.take_off!
		else 
				'cannot take off if weather is bad'
		end
	end

	def full?
		capacity == DEFAULT_CAPACITY
	end

	def capacity
	  @capacity = DEFAULT_CAPACITY
	end
end
