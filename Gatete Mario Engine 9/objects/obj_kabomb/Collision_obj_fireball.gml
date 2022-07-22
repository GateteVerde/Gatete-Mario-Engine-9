/// @description Lit Kab-omb

//If this enemy is not lit up
if (charge == 0) {

	//Lit up
	charge = 1;
	
	//Double horizontal speed
	xspeed = xspeed * 2;
	
	//Double animation speed
	image_speed = image_speed * 2;
	
	//Jump
	alarm[0] = 180;
	
	//Move towards Mario
	alarm[11] = 30;
}

//Destroy projectile
with (other) event_user(0);