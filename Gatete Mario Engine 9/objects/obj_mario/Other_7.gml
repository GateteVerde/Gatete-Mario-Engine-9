/// @description Make Mario do stuff when it's animation ends.

#region POWERUP SPECIFIC ANIMATIONS

	//If Mario does have the Bunny or Bee powerups
	if (global.powerup == cs_carrot)
	|| (global.powerup == cs_bee) {
	
		//If Mario is either gliding down or flying up
		if ((sprite_index == global.jump_sprite[cs_carrot])
		|| (sprite_index == global.jump_sprite[cs_bee]))
		    image_index = 1;
	}

	//If Mario does have either the frog or penguin suit
	if (global.powerup == cs_frog)
	|| (global.powerup == cs_penguin) {
	
		//If Mario is walking with the frog suit
		if (sprite_index == global.walk_sprite[cs_frog]) {

			//Play 'Frog' sound
			audio_play_sound(snd_frog, 0, false);

			//If the horizontal speed is not equal to 0.
			if (xspeed <> 0)
			    xspeed = 0;
		}
	
		//If Mario is swimming with either the frog or penguin powerup.
		if ((sprite_index == global.swim2_sprite[cs_frog]) || (global.swim2_sprite[cs_penguin]))
		|| ((sprite_index == global.swim3_sprite[cs_frog]) || (global.swim3_sprite[cs_penguin]))
		|| ((sprite_index == global.swim4_sprite[cs_frog]) || (global.swim4_sprite[cs_penguin])) {
	
			//If Balloon Mario does not exist
			if (!instance_exists(obj_mario_balloon)) {
		
				//Do play only if Mario has the Frog or Penguin powerups
				if (swimming == 1)
				&& ((abs(xspeed) > 0) || (abs(yspeed) > 0)) {

				    //Play 'Swim' sound
				    audio_stop_sound(snd_swim);
				    audio_play_sound(snd_swim, 0, false);
				}
			}
		}
	}
	
	//If Mario does have the shell powerup...
	if (global.powerup == cs_shell) {
	
		//...and Mario is sliding inside the shell
		if (sprite_index == global.slide_sprite[cs_shell])
			image_index = 2;
	}
	
	//If Mario does have the cat suit...
	if (global.powerup == cs_bell) {
	
		//...and it's climbing a wall
		if (sprite_index == global.climb2_sprite[cs_bell])
			image_index = 1;
	}
	
	//If Mario does have the football gear
	if (global.powerup == cs_football) {
	
		//...and Mario is shoulder bashing
		if (sprite_index == global.run_sprite[cs_football]) {
	
			//Stop and Play 'Football' sound
			audio_stop_sound(snd_bump);
			audio_play_sound(snd_bump, 0, false);
		}
	}

#endregion

//If Mario is doing a twirl
if (twirl == 1)
&& (sprite_index == global.spin_sprite[global.powerup]) {

	//Enable gravity
	enable_gravity = 1;

	//End twirl and allow twirling again after one quarter of a second
	twirl = 2;
	timer(allow_twirl_f, 15, false);
}