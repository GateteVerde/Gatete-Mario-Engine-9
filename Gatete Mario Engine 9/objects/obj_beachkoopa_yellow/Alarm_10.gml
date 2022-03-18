/// @description Move towards Mario

//If the koopa can move
if (ready > 0) {

	//If the koopa is frozen in place
	if (freeze == true) {

		alarm[10] = 1;
		exit;
	}

	//If the koopa can move
	if (ready > 0) {

	    //Set walking sprite
	    sprite_index = spr_beachkoopa_yellow_walk;
	
		//Animate
		image_speed = 1;
	
		//Set ready state
		ready = 2;
		
		//Turn towards Mario
		alarm[9] = 60;
	
		//If Mario does not exist or Mario is at the left
		if (!instance_exists(obj_mario))
		|| (obj_mario.x < x)
			xspeed = (swimming == true) ? -0.4 : -0.8;
		else
			xspeed = (swimming == true) ? 0.4 : 0.8;		
	}
}