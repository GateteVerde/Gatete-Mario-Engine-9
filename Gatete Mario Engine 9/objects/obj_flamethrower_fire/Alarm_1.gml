/// @description Create third projectile

//If Mario does not exist or it does exist and it's not transforming
if (!instance_exists(obj_mario))
|| ((instance_exists(obj_mario)) && (instance_exists(obj_mario_transform))) {

    alarm[1] = 1;
    exit;
}

//Otherwise
else {

	alarm[2] = 5;
	with (instance_create_depth(xstart + random_range(-2, 2), ystart + random_range(-4, -2), 50, obj_flamethrower_fire_b)) {

		motion_set(other.direction, 5.25);
		xspeed = hspeed;
		yspeed = vspeed;
		speed = 0;
	}
}