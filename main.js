
var Robot = require('./includes/robot');

var robot = new Robot("Reabot", 5 , 5);

robot.welcome();

if(process.argv.length > 2){
	var rl = require('readline').createInterface({
	  input: require('fs').createReadStream(process.argv[2])
	});

	rl.on('line', function (text) {
	  robot.listen(text.trim().toUpperCase());
	});
}

process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function (text) {
	if ((text= text.trim().toUpperCase()) === 'EXIT') {
	 	process.exit();
	}else{
		robot.listen(text);
	}	
});
