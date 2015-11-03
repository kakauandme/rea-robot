class Robot	

	@x = nil
	@y = nil
	@facing = nil

	@@directions = ["NORTH", "EAST", "SOUTH", "WEST"]


	def initialize(_width, _height)

		if !(_width.is_a? Integer) || _width <= 0 || !(_height.is_a? Integer)  || _height <=0 
			raise "Table width & height should be positive integers";
		end

		@@table_width = _width;
		@@table_height = _width;
	end

	

	def place(_x, _y, _facing)
		if (_x.is_a? Integer) && (_y.is_a? Integer) && _x >= 0 && _x < @@table_width && _y >= 0 && _y < @@table_height
			@x = _x
			@y = _y
		else
			@x = nil
			@y = nil
		end

		if (_facing.is_a? String)
			@@directions.each_with_index do |direction, index|
				if _facing.upcase == direction
					@facing = index
					break;
				end
			end
		else
			@facing = nil
		end
	end

	def isPlaceed
		(!(@x.nil?) && !(@y.nil?) && !(@facing.nil?) && @x >= 0 && @x < @@table_width && @y >= 0 && @y < @@table_height)
	end


	

end


r = Robot.new(5,5)

