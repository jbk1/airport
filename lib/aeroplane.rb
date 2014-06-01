require_relative 'weather'
require_relative 'airport'


class Aeroplane

include Weather

	def initialize
		@taken_off = false
		@flying = false
	end

	def flying?
		@flying
	end

	def taken_off?
		if take_off_allowed? == true
			@taken_off = true
		else
			@taken_off = false
		end
	end

end
