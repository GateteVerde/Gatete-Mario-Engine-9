/// @description Turnip bomb

//Inherit the parent event
event_inherited();

//Timer
aa = 0;

//Allow collision
allow_collision = true;

//Create semisolid
mytop = instance_create_layer(x, y+2, "Main", obj_semisolid);