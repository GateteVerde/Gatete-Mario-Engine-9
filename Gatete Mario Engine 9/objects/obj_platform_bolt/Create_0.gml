/// @description Bolt Lift

//Do not animate
image_speed = 0;
image_index = 0;

//Current state
//0: On-Screw
//1: Falling
//2: Waiting for respawn
state = 0;

//Spin flag
isspin = 0;

//Wall flags
touchwall_l = 0;
touchwall_r = 0;

//Platform offset
platform_offset = 0;

//Create semisolid mask
mytop = instance_create_layer(x, y, "Main", obj_platform_bolt_top);
with (mytop)
	image_xscale = other.image_xscale;