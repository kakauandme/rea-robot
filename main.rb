require_relative 'includes/robot' 
robot = Robot.new("Reabot", 5,5)


#read test file
if ARGV.length > 0
	filename = ARGV.first
	File.readlines(filename).each do |line|
		robot.listen(line.chomp.upcase)
	end
end

puts robot.welcome

#get input from STD and pass it to robot or exit
while (input = STDIN.gets.chomp.upcase) != "EXIT"	
	robot.listen(input)
end