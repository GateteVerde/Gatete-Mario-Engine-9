/// @description Throw projectile to the left

//If Mario has the Fiery Raccoon powerup
if (global.powerup == cs_fraccoon) {

	//Play 'Fireball' sound
	audio_play_sound(snd_fireball, 0, false);
				
	//Create Fireball
	with (instance_create_depth(x, y, -2, obj_fireball)) {
            
		//Match the speed to the player's direction
		xspeed = -3;
	}
}

//Otherwise, if Mario has the Chill Raccoon powerup
else if (global.powerup == cs_iraccoon) {

	//Play 'Iceball' sound
	audio_play_sound(snd_iceball, 0, false);
				
	//Create Iceball
	with (instance_create_depth(x, y, -2, obj_iceball)) {
            
		//Match the speed to the player's direction
		xspeed = -1.2;
	}
}