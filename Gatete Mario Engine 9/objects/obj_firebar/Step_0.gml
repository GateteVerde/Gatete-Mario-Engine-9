/// @description Set the angle of the firebar

//Do not move if Mario is dead or transforming
if (!instance_exists(obj_mario_dead))
&& (!instance_exists(obj_mario_transform)) {

	angle += spd*(clockwise*-1);
	if (angle > 360)
	    angle -= 360;
}
