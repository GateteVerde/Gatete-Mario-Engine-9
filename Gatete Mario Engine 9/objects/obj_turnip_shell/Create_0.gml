/// @description Turnip Shell

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;
image_index = 0;

//Bounces
bounces = -1;

//Hurt player?
hurtplayer = 0;

//Allow collision
allow_collision = true;

//Create semisolid collision
mytop = instance_create_layer(-1000, -1000, "Main", obj_semisolid);

//Whether this shell is falling through one tile gaps
check = 0;