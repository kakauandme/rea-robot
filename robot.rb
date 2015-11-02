module Direction
	N = 0
	E = 1
	S = 2
	W = 3
end

class Robot

	

	@x = nil
	@y = nil
	@direction = nil


	def initialize(width, height)

		if !(width.is_a? Numeric) || width <= 0 || !(height.is_a? Numeric)  || height <=0 
			raise "Table width & height should be positive numbers";
		end

		@@table_width = width;
		@@table_height = width;
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