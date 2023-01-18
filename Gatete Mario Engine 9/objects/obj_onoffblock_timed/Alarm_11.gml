/// @description Decrement timer

//If the counter is at 1, change all blocks
if (image_index == 2) {
	
	//Play 'Switch' sound
	audio_play_sound(snd_switch, 0, false);
	
	//Swap block
	global.on_off_block = !global.on_off_block;
	
	//With all on off blocks
	with (obj_onoffblock_timed) {

		//Set sprite
		sprite_index = (global.on_off_block == 0) ? spr_onoffblock_timed_b_change : spr_onoffblock_timed_r_change;
	
		//Animate
		image_speed = 1;
		image_index = 0;
	}
	
	//End alarm
	alarm[11] = -1;
}

//Otherwise, decrement one second
else {
	
	//Play sound if inside the view
	if (outside_view() == false) {
		
		audio_play_sound(snd_move, 0, false);
	}

	//Change frame
	image_index++;
	
	//Repeat
	alarm[11] = 60;
}