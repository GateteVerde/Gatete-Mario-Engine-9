/// @description Generate a Rinka

//If outside view, ignore event
if (outside_view() == true)
|| (instance_exists(obj_mario_dead))
|| (instance_exists(obj_mario_transform)) {

	alarm[0] = 1;
	exit;
}

//Create a Rinka
instance_create_depth(x + 8, y + 7, 50, obj_rinka);

//Repeat the process
alarm[0] = round(random_range(120, 180));
