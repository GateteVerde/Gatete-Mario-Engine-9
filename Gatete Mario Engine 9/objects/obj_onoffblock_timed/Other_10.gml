/// @description Swap sprite

//Play 'Switch' sound
audio_play_sound(snd_switch, 0, false);

//Swap block
global.on_off_block = !global.on_off_block;

//With all the blocks
with (obj_onoffblock_timed) {

	//Set sprite
	sprite_index = (global.on_off_block == 0) ? spr_onoffblock_timed_b_change : spr_onoffblock_timed_r_change;

	//Animate
	image_speed = 1;
	image_index = 0;
}

//End timer
alarm[11] = -1;