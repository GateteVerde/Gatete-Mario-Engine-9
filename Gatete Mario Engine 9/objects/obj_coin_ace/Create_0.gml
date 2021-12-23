/// @description Ace Coin

//Inherit event from parent
event_inherited();

//Whether this coin was hit with a pow block
ready = 0;

//Bounces
bounces = 3;

//If this coin has been collected before, destroy
if (ds_map_find_value(global.acecoins, id)) {

	instance_destroy();
	exit;
}