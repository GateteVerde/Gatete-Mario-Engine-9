/// @description Hurt the player

//If the icicle is falling
if (ready == 2) {

	//Play 'Icicle' sound
	audio_play_sound(snd_icicle, 0, false);
				
	//Create sparks
	repeat(32) {

		with (instance_create_depth(x + 8, y + 16, -4, obj_sparkle)) {
				
			motion_set(random(360), random(1));
			gravity = 0.1;
		}
	}
	
	//Move to the bottom boundary
	y = room_height;
}

with (other) event_user(0);