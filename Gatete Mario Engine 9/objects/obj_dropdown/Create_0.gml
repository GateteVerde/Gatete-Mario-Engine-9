/// @description Mario's doing a drop-down attack

#region PHYSICS VARIABLES

	// Custom movement 
	xspeed = 0;
	yspeed = 0;
	xadd = 0;
	yadd = 0;

	yspeed_cap = 4;

	//Slope sensors
	slopesensor_x = 0;
	slopesensor_y1 = 8;
	slopesensor_y2 = 16;
	slopesensor_extendedcheck = 0;
	slopesensor_slopeid = noone;

	//Whether gravity is enabled
	enable_gravity = 0;

#endregion

//Animate
image_speed = 0.35;
image_index = 0;

//Combo
hitcombo = 0;

//Whether Mario can cancel attack
ready = 0;

//Scale
xscale = 1;

//With Mario
with (obj_mario) {

	//Stop movement
	xspeed = 0;
	yspeed = 0;
	
	//Disable gravity
	disablegrav = 0;
	
	//Make Mario invisible
	visible = false;
	
	//Make Mario invulnerable
	invulnerable = true;
	
	//Disable Mario's control
	enable_control = false;
}

//Flashing
isflashing = 0;