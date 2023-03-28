/// @description Snap on Mario's position when held

//If Mario does exist
if (instance_exists(obj_mario)) {
	
	//If the balloon is being held
	if (ready == 1) {

		#region MARIO X POSITION
		
			if (balloons == 2)
				obj_mario.x = (obj_mario.xscale == 1) ? x-8 : x+8;
			else
				x = obj_mario.x+8 * sign(obj_mario.xscale);
		#endregion
		
		//Force Mario holding sprite
		with (obj_mario) holding = 3;
		
		//If this balloon flies up
		if (balloons > 1) {
			
			//If Mario is small
			if (global.powerup == cs_small)
				obj_mario.y = ceil(y)+13;
			else
				obj_mario.y = ceil(y)+24;
		}
		
		//Otherwise
		else {
			
			//If Mario is small
			if (global.powerup == cs_small)
				y = obj_mario.y-13;
			else
				y = obj_mario.y-24;
		}
	}
}