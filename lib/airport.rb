require 'weather'

class Airport

	include Weather

		DEFAULT_CAPACITY = 5
# Had a problem allocating good or bad weather to an aeroplane object?!
		
		def initialize
			@airport_contents ||= []
			@good_weather = [true, true, true, false].sample
		end

		def airport_plane_count?
			@airport_contents.count
		end

		def land_plane!(plane)
			
			if airport_plane_count? >= capacity
    		'bravo tango one niner, gate capacity reached, divert elsewhere, over'

    	elsif good_weather? == false
    		'cannot land weather is bad'

	    else @airport_contents << plane

	  	end	
		end

		# def check_capicity!
		# 	if airport_plane_count? > capacity?
		# 		raise 'this airport is full'
		# 	end
		# end	

		def full?
			capacity == DEFAULT_CAPACITY
		end

		def capacity
		@capacity = DEFAULT_CAPACITY
		end


end
