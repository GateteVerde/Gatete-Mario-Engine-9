/// @description Throw projectile to the right

//If Mario has the Fiery Raccoon powerup
if (global.powerup == cs_fraccoon) {
	
	//If there's less than 2 fireballs
	if (instance_number(obj_fireball) < 2) {

		//Play 'Fireball' sound
		audio_play_sound(snd_fireball, 0, false);
				
		//Create Fireball
		with (instance_create_depth(x, y, -2, obj_fireball)) {
            
			//Match the speed to the player's direction
			xspeed = 3;
		}

		//Throw a projectile to the left
		alarm[1] = 12;
	}
}

//Otherwise, if Mario has the Chill Raccoon powerup
else if (global.powerup == cs_iraccoon) {
	
	//If there's less than 2 iceballs
	if (instance_number(obj_iceball) < 2) {

		//Play 'Iceball' sound
		audio_play_sound(snd_iceball, 0, false);
				
		//Create Iceball
		with (instance_create_depth(x, y, -2, obj_iceball)) {
            
			//Match the speed to the player's direction
			xspeed = 1.2;
		}

		//Throw a projectile to the left
		alarm[1] = 12;
	}
}