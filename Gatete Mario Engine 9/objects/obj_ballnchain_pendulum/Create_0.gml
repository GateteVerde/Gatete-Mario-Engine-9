/// @description Pendulum Ball 'n' Chain

/*
//  This item uses creation code.
//
//  distance    = Distance between platform and center
//	spd			= Speed of the pendulum
*/

//Default values
distance = 48;
spd = 0.495;

//Depth
depth = 10;

//Create the platform
platform = instance_create_depth(x, y, -1, obj_ballnchain_ball_pendulum);
platform.image_xscale = image_xscale;
platform.parent = id;