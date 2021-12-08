/// @description Follow up the player

//Round position
x = round(x);
y = round(y);

//If Mario does exists, follow him
if (instance_exists(obj_mario)) {

	x = obj_mario.x;
	y = obj_mario.y;
}