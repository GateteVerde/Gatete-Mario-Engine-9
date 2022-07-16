/// @description Fire Flower

//Inherit the parent event
event_inherited();

//Sequence to display
//0: Small to big
//1: Big to small
//2: Powerup
//3: Powerdown
//4: Transform
sequence = 2;

//If colour blind mode is active, change sprite
if (obj_coordinator.colourblind == 1)
	sprite_index = spr_fireflower_cb;