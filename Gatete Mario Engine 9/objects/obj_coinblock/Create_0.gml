/// @description Coin Challenge Block

//Inherit event from parent
event_inherited();

//Check if moving to the HUD position
ready2 = 0;

//Destroy if the house in the current world is active
if (global.star_house[global.world] > 1) {

	instance_destroy();
	exit;
}