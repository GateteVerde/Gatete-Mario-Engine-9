/// @description Ace Coin

//If this coin has been collected before, destroy
if (ds_map_find_value(global.acecoins, id)) {

	instance_destroy();
	exit;
}