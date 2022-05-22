/// @description Set blow up sprite or lose followers

//If there's not more fireballs
if (followers == 1) {

	//Set flashing sprite
	sprite_index = spr_flamechomp_flash;
	
	//Blow up
	alarm[2] = 150;
}

//Otherwise
else {

	//Store momentum
	oldxspeed = xspeed;
    oldyspeed = yspeed;
	
	//Stop
	ready = 1;
	
	//Remove followers
	followers--;
}

//Animate
image_speed = 1;
