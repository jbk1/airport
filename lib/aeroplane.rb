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

	def take_off!
		@flying = true
	end

  def land!
    @flying = false
  end
end
