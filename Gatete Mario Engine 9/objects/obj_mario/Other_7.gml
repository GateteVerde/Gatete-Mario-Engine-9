/// @description Make Mario do stuff when it's animation ends.

//If Mario is walking with the frog suit
if (sprite_index == global.walk_sprite[cs_frog]) {

    //Play 'Frog' sound
    audio_play_sound(snd_frog, 0, false);

    //If the horizontal speed is not equal to 0.
    if (xspeed <> 0)
        xspeed = 0;
}

//Otherwise, if Mario is doing a twirl
else if ((sprite_index == global.spin_sprite[global.powerup]) && (twirl == 1)) {

	//Enable gravity
	enable_gravity = 1;

	//End twirl and allow twirling again after one quarter of a second
	twirl = 2;
	timer(allow_twirl_f, 15, false);
}

//Otherwise, if Mario is floating with the either the carrot or bee powerup.
else if ((sprite_index == global.jump_sprite[cs_carrot])
|| (sprite_index == global.jump_sprite[cs_bee]))
    image_index = 1;
    
//Otherwise, if Mario is sliding inside his shell.
else if (sprite_index == global.slide_sprite[cs_shell])
    image_index = 2;
    
//Otherwise, if Mario is climbing with the cat suit
else if (sprite_index == global.climb2_sprite[cs_bell])
    image_index = 1;
    
//Otherwise, if Mario is swimming with either the frog or penguin powerup.
else if ((sprite_index == global.swim2_sprite[cs_frog]) || (global.swim2_sprite[cs_penguin]))
|| ((sprite_index == global.swim3_sprite[cs_frog]) || (global.swim3_sprite[cs_penguin]))
|| ((sprite_index == global.swim4_sprite[cs_frog]) || (global.swim4_sprite[cs_penguin])) {
	
	//If Balloon Mario does not exist
	if (!instance_exists(obj_mario_balloon)) {
		
		//Do play only if Mario has the Frog or Penguin powerups
		if (swimming == 1)
		&& ((global.powerup == cs_frog) || (global.powerup == cs_penguin)) {

		    //Play 'Swim' sound
		    audio_stop_sound(snd_swim);
		    audio_play_sound(snd_swim, 0, false);
		}
	}
}

//Otherwise, if Mario is dashing while having the football suit
else if (sprite_index == global.run_sprite[cs_football]) {

    //Play 'Bump' sound
    audio_stop_sound(snd_bump);
    audio_play_sound(snd_bump, 0, false);
}