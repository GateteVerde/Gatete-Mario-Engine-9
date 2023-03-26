/// @description Snap on Mario's position when held

//If Mario does exist
if (instance_exists(obj_mario)) {
	
	//If the balloon is being held
	if (ready == 1) {

		//Stay on Mario's X position
		x = obj_mario.x+8 * sign(obj_mario.xscale);
		
		//Force Mario holding sprite
		with (obj_mario) holding = 3;
		
		//If this balloon flies up
		if (glide_up == true) {
			
			//If Mario is small
			if (global.powerup == cs_small)
				obj_mario.y = ceil(y)+13;
			else
				obj_mario.y = ceil(y)+24;
		}
		
		//Otherwise
		else if (glide_up == false) {
			
			//If Mario is small
			if (global.powerup == cs_small)
				y = obj_mario.y-13;
			else
				y = obj_mario.y-24;
		}
	}
}