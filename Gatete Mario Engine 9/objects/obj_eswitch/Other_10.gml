/// @description Perform Switch events

//Play 'Switch' song
audio_play_sound(snd_switch, 0, false);
    
//Change sprite
sprite_index = spr_eswitch_press;
    
//Destroy it
alarm[0] = 60;
	
//Stop Mario vertical speed
obj_mario.yspeed = 0;

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

//Destroy solid mask
with (mysolid) instance_destroy();