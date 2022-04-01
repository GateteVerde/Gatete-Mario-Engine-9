/// @description Move based on position

if (!instance_exists(obj_mario_dead))
&& (!instance_exists(obj_mario_transform)) {

	alarm[0] = 1;
	exit;
}

if (x == xstart) {

	vspeed = -0.5;
	hspeed = -0.5;
}
else {

	vspeed = 0.5;
	hspeed = 0.5;
}