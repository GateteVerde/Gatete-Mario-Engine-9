/// @description End G-Switch event

//If the switch event is active
if (gswitch_on == true) {
	
	//Stop P-Switch song
	if (pswitch_on == false) {
		
		audio_stop_sound(snd_pswitch);
	}
	
	//Turn off G-Switch event
	gswitch_on = false;
	
	//Reset G-Switch warning
	gswitch_warn = 0;
	
    //Restart the invincibility music if it was stopped due to overlap.
    if (instance_exists(obj_invincibility)) {
    
        if (obj_invincibility.alarm[0] > -1) {
			
			if (instance_exists(obj_megashroom_timer))
				obj_megashroom_timer.alarm[1] = 2;
			else
				obj_invincibility.alarm[2] = 2;
		}
        else
            alarm[0] = 2;
    }
    
    //Otherwise, restart
    else if (pswitch_on == false)
        alarm[0] = 2;
}
