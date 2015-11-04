//constructor (String, Integer, Integer)
var Robot = function(_name, _width, _height) {

	//set robot's name
	this.name = _name;

	if(_width > 0 && _height > 0){

		//set table dimensions
		this.table_width = _width; 
		this.table_height = _height;
	}else{
		throw new Error('Table width & height should be positive integers');
	}
	
	this.directions = ["NORTH", "EAST", "SOUTH", "WEST"];

	this.x = false;
	this.y = false;
	this.facing = false;

};

//checks if robot is placed
Robot.prototype.isPlaced = function() {
	return (this.x !== false && this.y !== false && this.facing !== false);
};

//place (Integer, Integer, String)
Robot.prototype.place = function(_x,_y,_facing) {

	if(_x >= 0 && _x < this.table_width && _y >= 0 && _y < this.table_height){
		this.x = _x;
		this.y = _y;
	}else{
		this.x = false;
		this.y = false;
	}

	//loop through all possible directions
	var i = 0;
	for (;i < this.directions.length; i++) {
		
		if(this.directions[i] == _facing.toUpperCase()){

			//assign if it matches
			this.facing = i;
			break;
		}
	}
	if(i >= this.directions.length){
		this.facing = false;
	}
};

//print curent position if placed
Robot.prototype.report = function() {

	if(this.isPlaced()){

		console.log( this.name + " is located at ["+this.x+","+this.y+"] and facing " + this.directions[this.facing]);
	}
};


//move, unless on the edge or not placed
Robot.prototype.move = function() {
	if(this.isPlaced()){

		switch (this.directions[this.facing]){
			case "NORTH":
			if ((this.y+1) < this.table_height){
				this.y++;
			}
			break;
			case "SOUTH":
			if ((this.y-1) >= 0){
				this.y--;
			}
			break;
			case "EAST":
			if ((this.x+1) < this.table_width){
				this.x++;
			}
			break;
			case "WEST":
			if ((this.x-1) >= 0){
				this.x--;
			}
		}
	}
};

//change direction counter clockwise
Robot.prototype.left = function() {
	if(this.isPlaced()){
		if (this.facing===0){
			this.facing = this.directions.length-1;
		}else{
			this.facing--;
			
		}
	}
};

//change direction clockwise
Robot.prototype.right = function() {
	if(this.isPlaced()){
		if (this.facing === this.directions.length-1){
			this.facing = 0;
		}else{
			this.facing++;
			
		}
	}
};

//process commands (String)
Robot.prototype.listen = function(_input){
	if(_input === "REPORT"){
		this.report();
	}else if(_input === "MOVE"){
		this.move();
	}else if(_input === "LEFT"){
		this.left();
	}else if(_input === "RIGHT"){
		this.right();
	}else {
		//match placing format
		var pattern = /^PLACE\s(\d),\s?(\d),\s?([a-zA-Z]{4,5})$/i;
		if(pattern.test(_input)){
			var args = _input.match(pattern)
			this.place(parseInt(args[1]), parseInt(args[2]), args[3]);
		}
	}
}

//print instructions
Robot.prototype.welcome= function() {
	console.log("\nHi human! I'm "+this.name+" and you can conrol me with several commands. \nBy typing PLACE X,Y, DIRECTION where X & Y are cordinates on a "+this.table_width+" by "+this.table_height+" table I will be placed on and DIRECTION is cardinal direction I will be facing. \nType MOVE and I'll go one step forward. \nLEFT & RIGHT will change my facing direction accordignly.\nFinnaly, REPORT will print my current location. \nOh, almost forget, if you are done - just type EXIT. \nEnjoy!\n");
};


module.exports = Robot;