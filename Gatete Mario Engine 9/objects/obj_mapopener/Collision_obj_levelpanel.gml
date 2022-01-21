/// @description Make the panel visible

with (other) {
	
	//If not visible
	if (image_alpha == 0) {
		
		//Play 'Peach Door' sound
		audio_play_sound(snd_door_peach, 0, false);
		
		//Make it visible
		image_alpha = 1;
		
		//Remember it
		ds_map_replace(global.worldmap, id, 1);
	}
}