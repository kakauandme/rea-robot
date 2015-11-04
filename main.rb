require_relative 'includes/robot' 
r = Robot.new("Reabot", 5,5)


#read test file
if ARGV.length > 0
	filename = ARGV.first
	File.readlines(filename).each do |line|
		r.listen(line.chomp.upcase)
	end
end

puts r.welcome

#get input from STD and pass it to robot or exit
while (input = STDIN.gets.chomp.upcase) != "EXIT"	
	r.listen(input)
end