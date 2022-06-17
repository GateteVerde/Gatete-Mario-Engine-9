/// @description Set movement

//If Mario exists
if (instance_exists(obj_mario)) {

	if (obj_mario.x > x)
		move_ready = 1;
	else if (obj_mario.x < x)
	    move_ready = 2;
}