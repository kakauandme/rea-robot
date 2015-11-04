
var Robot = require('./includes/robot');

var robot = new Robot("Reabot", 5 , 5);
robot.welcome();




process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function (text) {
	if ((text= text.trim().toUpperCase()) === 'EXIT') {
	 	process.exit();
	}else{
		robot.listen(text);
	}	
});
