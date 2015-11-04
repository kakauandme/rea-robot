var Robot = function(_name, _width, _height) {

	this.name = _name;


	if(_width > 0 && _height > 0){
		this.table_width = _width; 
  		this.table_height = _height;
	}else{
		throw new Error('Table width & height should be positive integers');
	}
  	


  	this.directions = ["NORTH", "EAST", "SOUTH", "WEST"];

  	this.x = null;
  	this.y = null;
  	this.facing = null;

};

Robot.prototype.isPlaced = function() {
	return (this.x && this.y && this.facing);
};

module.exports = Robot;