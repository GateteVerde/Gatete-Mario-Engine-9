/// @description Prevent Mario from moving too far from the flagpole

if (instance_exists(obj_mario)) {

	//If Mario is flying
	if (instance_exists(obj_mario_fly)) {
	
		if (obj_mario_fly.x > x+8) {
		
			obj_mario_fly.x = x+8;
			if (obj_mario_fly.xspeed > 0)
				obj_mario_fly.xspeed = 0;
		}
	}
	
	//Otherwise, if Mario is doing the dropdown attack as Cat Mario
	else if (instance_exists(obj_mario_dropdown)) {
	
		if (obj_mario_dropdown.x > x+8) {
		
			obj_mario_dropdown.x = x+8;
			if (obj_mario_dropdown.xspeed > 0)
				obj_mario_dropdown.xspeed = 0;
		}		
	}
	
	//Otherwise, if Mario has the balloon powerup
	else if (instance_exists(obj_mario_balloon)) {
	
		if (obj_mario_balloon.x > x+8) {
		
			obj_mario_balloon.x = x+8;
			if (obj_mario_balloon.xspeed > 0)
				obj_mario_balloon.xspeed = 0;
		}		
	}
	
	//Prevent Mario from moving far away
	else if (obj_mario.x > x+8) {
	
		obj_mario.x = x+8;
		if (obj_mario.xspeed > 0)
			obj_mario.xspeed = 0;
	}
}