/// @description A Flying Player!

#region PHYSICS VARIABLES

// Custom movement 
xspeed = 0;
yspeed = 0;
xadd = 0;
yadd = 0;

yspeed_cap = 4;

// Slope sensors
slopesensor_x = 0;
slopesensor_y1 = 8;
slopesensor_y2 = 16;
slopesensor_extendedcheck = 0;
slopesensor_slopeid = noone;

// Whether gravity is enabled
enable_gravity = 1;

// Flight ruined
flight_ruined = false;

// Full nose dive
nose_diving = false;

// Cape speed
cape_speed = 0;

// Flying up
flying = false;

// Fly cool-down
can_fly = true;

// At a wall?
at_wall = false;

#endregion

// Cape owner
owner = noone;

// Default image speed
image_speed = 0;

// Scales of object
xscale = 1;
yscale = 1;

// Flashing
isflashing = false;