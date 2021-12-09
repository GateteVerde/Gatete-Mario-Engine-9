/// @description Follow up the player

//Round position
x = round(x);
y = round(y);

//If Mario does exists, follow him and set up the same scale
if (instance_exists(obj_mario)) {
	
	//Do not change while there's a transformation object
	if (!instance_exists(obj_mario_transform)) {
		
		//Set radius
		radius = (global.powerup == cs_mega) ? lerp(radius, 120, 0.0325) : lerp(radius, 40, 0.0325);
	
		//Set light position
		x = obj_mario.x;
		if (global.powerup == cs_mega)
			y = obj_mario.y - 32;
		else
			y = obj_mario.y;
	}
}