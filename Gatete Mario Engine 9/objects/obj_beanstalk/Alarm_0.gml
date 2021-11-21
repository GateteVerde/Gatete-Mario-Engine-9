/// @description Allow creation of new vines

//Snap to the grid
move_snap(1, 16);

//If this creates regular vines
if (vinetype == 0) {
	
	with (instance_create_depth(x - 8, y, 12, obj_vine)) {

		image_speed = 0;
		image_index = 0;
	}
}

//Otherwise, if this creates side vines
else if (vinetype == 1) {

	with (instance_create_depth(x - 8, y, 12, obj_vine_side)) {

		image_speed = 0;
		image_index = 0;
	}	
}

//Repeat
alarm[0] = 16;