/// @description Pendulum Ball 'n' Chain (Ball) logic

//Do not move if Mario is dead or transforming
if (!instance_exists(obj_mario_dead))
&& (!instance_exists(obj_mario_transform)) {

	//Time it
	mytimer += parent.spd;
	angle = cos(mytimer * (parent.spd / 10)) * (pi/2);

	//Set the position of the block
	x = xx - sin(angle) * (parent.distance + 8);
	y = yy + cos(angle) * (parent.distance + 8);
}
