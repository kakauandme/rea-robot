# Toy Robot Simulator

- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.

### Get Started

Clone this repository
```bash
git clone https://github.com/kakauandme/rea-robot.git rea-robot
```

Change into the directory.
```bash
cd rea-robot
```

To run the robot use `ruby` command. This will compile the code and start the robot. 
```bash
ruby main.rb
```

Alternatively you can use `node` to compile JavaScript version
```bash
node main.js
```

To use a test script - pass `filename` as an argument to the compiler.
```bash
ruby main.rb test.txt
```

or
```bash
node main.js test.txt
```