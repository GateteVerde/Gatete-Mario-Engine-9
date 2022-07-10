/// @description Finish block bump

//Play 'Switch' sound
audio_play_sound(snd_switch, 0, false);

//If a timeline has been specified, trigger it.
if (tline != noone) {

	//Set the time
	timeline_index = tline;
		
	//If the timeline is not running
	if (timeline_running == 0) {
			
		timeline_position = 0;
		timeline_running = 1;
	}	
}

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Turn into a used block
instance_change(obj_emptyblock, false);