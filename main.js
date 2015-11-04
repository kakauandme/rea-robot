
var Robot = require('./includes/robot');

var robot = new Robot("Reabot", 5 , 5);
robot.welcome();
robot.place(0,0,"north");
robot.report();
robot.move();
robot.right();
robot.move();
robot.report();