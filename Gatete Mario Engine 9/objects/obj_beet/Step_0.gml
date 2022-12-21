/// @description Beetroot logic

//Inherit event from parent
event_inherited();

//If there's no gravity, bounce
if (yadd == 0) {
	
	//If the beet can bounce again
	if (bumps > 0) {
		
		//Play 'Hurt' sound
		audio_play_sound(snd_hurt, 0, false);
		
		//Create shell thump
		instance_create_depth(x, y+8, -6, obj_shellthump);
		
		//Reverse horizontal speed
		xspeed = -xspeed;

		//Bounce
		yspeed = -3;
		
		//Decrement bumps
		bumps--;
	}
	
	//Otherwise, destroy
	else {
	
		//Play 'Bump' sound
		audio_play_sound(snd_bump, 0, false);
		
		//Create smoke effect and destroy
		instance_create_depth(x, y+8, -6, obj_smoke);
		instance_destroy();
	}
}

//Keep gravity always at 0.15
yadd = 0.15;