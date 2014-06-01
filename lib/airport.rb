require_relative 'weather'

class Airport

include Weather

def take_off_allowed?
	if @weather == true
		return false
	else
		return true
	end
end


end
