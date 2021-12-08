/// @description Follow up the player

//Round position
x = round(x);
y = round(y);

//If Mario does exists, follow him and set up the same scale
if (instance_exists(obj_mario)) {
	
	//Do not change while there's a transformation object
	if (!instance_exists(obj_mario_transform)) {
		
		//If Mario has the mega mushroom powerup
		if (global.powerup != cs_mega) {
	
			//Set scale
			image_xscale = lerp(image_xscale, 1, 0.0325);
			image_yscale = lerp(image_xscale, 1, 0.0325);
		}
	
		//Otherwise, if Mario does not have it
		else {
	
			//Set scale
			image_xscale = lerp(image_xscale, 3, 0.0325);
			image_yscale = lerp(image_xscale, 3, 0.0325);
		}
	
		//Set light position
		x = obj_mario.x;
		if (global.powerup == cs_mega)
			y = obj_mario.y - 32;
		else
			y = obj_mario.y;
	}
}