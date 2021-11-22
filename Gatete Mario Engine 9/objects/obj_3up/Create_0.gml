/// @description 3-UP Moon

//Inherit the parent event
event_inherited();

//If this coin has been collected before, destroy
if (ds_map_find_value(global.moons, id)) {

	instance_destroy();
	exit;
}

//Do not move
xspeed = 0;

//Do not bounce
bouncy = 0;
bounces = 0;