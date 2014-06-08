require_relative 'weather'
require_relative 'airport'


class Aeroplane

include Weather

	def initialize
		@flying = false
	end

	def flying?
		@flying
	end

	def taken_off!
		@flying = true
	end


	# def taken_off?
	# 	if take_off_allowed? == true
	# 		@taken_off = true
	# 	else
	# 		@taken_off = false
	# 	end
	# end

end
