/// @description Create Mario

with (instance_create_depth(dest_x[global.pipetype] + 8, dest_y[global.pipetype], 150, obj_mario_warp)) {
	
	//Play 'Warp' sound
	audio_play_sound(snd_warp, 0, false);
	
	//Allow Mario to exit the pipe
	canmove = 1;
	ready = 1;
	
	//Set motion
	direction = other.dest_dir[global.pipetype];
}