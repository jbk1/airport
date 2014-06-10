# Review the appropriate and or overuse of method !? endings. FIX

# build a display airport contents method. FIX

# build a display planes in air method. FIX


require_relative 'aeroplane'
require_relative 'weather'

class Airport
	include Weather

	DEFAULT_CAPACITY = 5
	
  attr_reader :airport_contents
# when returning airport instance it doesn't show the name of the aeroplane instances in the return? FIX
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

# Allows plane to take off multiple times even if flying and no longer in airport? FIX
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
