/// @description Generate a Rinka

//If outside view, ignore event
if (outside_view() == true)
|| (instance_number(obj_mario_clear) > 0)
|| (instance_number(obj_mario_transform) > 0) {

	alarm[0] = 1;
	exit;
}

//Create a Rinka
instance_create_depth(x + 8, y + 7, 50, obj_rinka);

//Repeat the process
alarm[0] = 180;
