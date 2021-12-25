/// @description Cycle between frames

//If not bumped
if (ready == 0) {
	
	//Play 'Move' sound if inside the view
	if (outside_view() == false) {
	
		audio_play_sound(snd_move, 0, false);
	}
	
	//Change frame
	image_index++;
	if (image_index > 9)
		image_index = 0;
}

//Set alarm
alarm[2] = 12;