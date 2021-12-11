/// @description Key Gate

//Do not animate
image_speed = 0;
image_index = 0;

//If this gate was opened before, destroy
if (ds_map_find_value(global.doors, id)) {

	instance_destroy();
	exit;
}