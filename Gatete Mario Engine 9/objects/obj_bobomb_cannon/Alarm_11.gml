/// @description Turn towards Mario

//If the Mecha Koopa is not on the air
if (yadd > 0) {

	alarm[11] = 60;
	exit;
}

//Otherwise
else {

	//If Mario is at the left and the Wiggler is moving right
	if ((obj_mario.x < x) && (xspeed > 0))  {
    
		xspeed = (swimming) ? -0.5 : -1;
		alarm[11] = 60;
	}
    
	//Otherwise, if Mario is at the right and the Wiggler is moving left
	else if ((obj_mario.x > x) && (xspeed < 0)) {
    
		xspeed = (swimming) ? 0.5 : 1;
		alarm[11] = 60;
	}
    
	//Otherwise, repeat
	else
		alarm[11] = 60;
}
