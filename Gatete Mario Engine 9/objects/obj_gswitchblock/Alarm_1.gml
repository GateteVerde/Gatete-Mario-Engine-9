/// @description Finish block bump

//Play 'Switch' sound
audio_play_sound(snd_switch, 0, false);

//Activate switch events
with (obj_levelcontrol) {
    
    //Reset warning
    gswitch_warn = 0;
        
    //Restart timer
    alarm[6] = 60 * other.time;
        
    //Activate p-switch effect
	event_user(6);
}

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Allow block to be bumped again
ready = 0;