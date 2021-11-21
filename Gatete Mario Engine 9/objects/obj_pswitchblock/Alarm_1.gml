/// @description Finish block bump

//Play 'Switch' sound
audio_play_sound(snd_switch, 0, false);

//Activate switch events
with (obj_levelcontrol) {
    
    //Reset warning
    pswitch_warn = 0;
        
    //Restart timer
    alarm[5] = 400;
        
    //Activate p-switch effect
	event_user(5);
}

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Allow block to be bumped again
ready = 0;