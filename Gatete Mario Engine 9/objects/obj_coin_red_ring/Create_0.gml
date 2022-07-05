/// @description Red Ring

//Scale
scale = 1;

//Destroy if this ring was collected before
if (ds_map_find_value(global.redrings, id)) {

	instance_destroy();
	exit;
}