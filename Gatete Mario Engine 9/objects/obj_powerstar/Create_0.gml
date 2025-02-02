/// @description Power Star

//Inherit the parent event
event_inherited();

//Check if time has been collected
ready = 0;

//Check if star has been collected
ready2 = 0;

//Set motion
yspeed = 0.75;

//Leave a trail
alarm[2] = 4;

//If this coin has been collected before, set different sprite
if (ds_map_find_value(global.powerstars, id))
	sprite_index = spr_powerstar_get;
