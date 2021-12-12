/// @description Turn into balloon Mario

//If Mario does not have the mega powerup
if (global.powerup != cs_mega) {

	//If Balloon Mario does not exist
	if (!instance_exists(obj_mario_balloon)) {
		
		myballoon = instance_create_layer(other.x, other.y, "Main", obj_mario_balloon);
			myballoon.xspeed = other.xspeed;
			myballoon.yspeed = other.yspeed;
	}
	
	//Otherwise, reset timers
	else {
	
		//Play 'Balloon' sound
		audio_play_sound(snd_balloon, 0, false);
	
		//With Balloon Mario
		with (obj_mario_balloon) {
	
			deflate = 0;
			alarm[0] = 1260;
			alarm[1] = 1440;
		}
	}
	
	//If Mario is tiny, return into Small Mario
	if (global.powerup == cs_tiny)
		global.powerup = cs_small;
}

//Destroy
instance_destroy();