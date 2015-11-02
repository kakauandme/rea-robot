module Direction
	NORTH = 0
	EAST = 1
	SOUTH = 2
	WEST = 3
end

class Robot

	

	@x = nil
	@y = nil
	@direction = nil


	def initialize(width, height)

		if !(width.is_a? Integer) || width <= 0 || !(height.is_a? Integer)  || height <=0 
			raise "Table width & height should be positive integers";
		end

		@@table_width = width;
		@@table_height = width;
	end

	def position(_x, _y, _direction)

		if _x >= 0 && _x < self.table_width && _y >= 0 && _y < self.table_height
			self.x = _x
			self.y = _y
		end
		case _direction
			when 'NORTH'
			  self.direction = Direction.NORTH
			when 'EAST'
			   self.direction = Direction.EAST
			when 'SOUTH'
			   self.direction = Direction.SOUTH
			when 'WEST'
			   self.direction = Direction.WEST
			else
			  self.direction = nil
		end		
	end


	def isPositioned
		return (self.x && self.y && self.direction && self.x >= 0 && self.x < self.table_width && self.y >= 0 && self.y < self.table_height)
	end

	def table_width
		@@table_width
	end
	def table_height
		@@table_height
	end




end


r = Robot.new(5,5)

puts r.table_width