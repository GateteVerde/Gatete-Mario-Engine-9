/// @description 1-UP Mushroom

//Inherit the parent event
event_inherited();

//Do not move
xspeed = 0;

//If colour blind mode is active, change sprite
if (obj_coordinator.colourblind == 1)
	sprite_index = spr_1up_cb;