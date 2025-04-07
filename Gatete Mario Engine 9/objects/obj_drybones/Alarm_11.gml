/// @description Turn towards Mario

//If Mario does not exists, exit
if (!instance_exists(obj_mario)) {
	
	alarm[11] = 1;
	exit;
}

//If the Dry Bones is not throwing a bone
if (sprite_index == spr_drybones) {

	//If Mario is at the left and the Wiggler is moving right
	if ((obj_mario.x < x) && (xspeed > 0))  {
    
		xspeed = (swimming) ? -0.25 : -0.5;
		alarm[11] = 60;
	}
    
	//Otherwise, if Mario is at the right and the Wiggler is moving left
	else if ((obj_mario.x > x) && (xspeed < 0)) {
    
		xspeed = (swimming) ? 0.25 : 0.5;
		alarm[11] = 60;
	}
    
	//Otherwise, repeat
	else
		alarm[11] = 60;
}
