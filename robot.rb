class Robot	

	@x = nil
	@y = nil
	@facing = nil

	@@directions = ["NORTH", "EAST", "SOUTH", "WEST"]


	def initialize(_name, _width, _height)

		if !(_name.is_a? String)
			raise "Name of the Robot should be a string";
		end

		@name = _name

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

	def report
		if self.isPlaceed
			puts "#{@name} is located at [#{@x},#{@y}] and facing #{@@directions[@facing]}"
		end
	end

	def move
		if self.isPlaceed
			case @@directions[@facing]
			when "NORTH"
				if (@y+1) < @@table_height
					@y+=1
				end
			when "SOUTH"
				if (@y-1) >= 0
					@y-=1
				end
			when "EAST"
				if (@x+1) < @@table_width
					@x+=1
				end
			when "WEST"
				if (@x-1 >= 0)
					@x-=1
				end
			end
		end
	end

	def left
		if self.isPlaceed
			if @facing==0
				@facing = @@directions.length-1
			else
				@facing-=1
			end
		end
	end

	def right
		if self.isPlaceed
			if @facing == (@@directions.length-1)
				@facing = 0
			else
				@facing+=1
			end
		end
		
	end

	def listen(_input)
		case _input
		when "REPORT"
			self.report
		when "MOVE"
			self.move
		when "LEFT"
			self.left
		when "RIGHT"
			self.right
		when /\APLACE\s\d,\s?\d,\s?[a-zA-Z]{4,5}\z/i
			coords = _input.scan(/\d/i)
			direction = _input.scan(/[a-zA-Z]{4,5}\z/i)[0]
			self.place(coords[0].to_i, coords[1].to_i,direction)
		end
	end

end


r = Robot.new("Reabot", 5,5)

if ARGV.length > 0
	filename = ARGV.first
	File.readlines(filename).each do |line|
		r.listen(line.chomp.upcase)
	end
end

while (input = STDIN.gets.chomp.upcase) != "EXIT"	
	r.listen(input)
end