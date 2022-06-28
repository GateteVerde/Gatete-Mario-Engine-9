/// @description Set up 'mapstate.idle' status if in 'mapstate.wait' state

//If the map is still updating, exit event
if (global.clear > 0)
|| (instance_number(obj_save) > 0)
|| (instance_number(obj_mapopener) > 0) {

	alarm[10] = 1;
	exit;
}

if (status == mapstate.wait)
	status = mapstate.idle;