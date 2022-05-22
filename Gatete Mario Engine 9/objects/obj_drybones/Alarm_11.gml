/// @description Turn towards Mario

//If the Dry Bones is not throwing a bone
if (sprite_index == spr_drybones) {

	//If Mario is at the left and the Wiggler is moving right
	if ((obj_mario.x < x) && (xspeed > 0))  {
    
		xspeed = -1;
		alarm[11] = 40;
	}
    
	//Otherwise, if Mario is at the right and the Wiggler is moving left
	else if ((obj_mario.x > x) && (xspeed < 0)) {
    
		xspeed = 1;
		alarm[11] = 40;
	}
    
	//Otherwise, repeat
	else
		alarm[11] = 40;
}
