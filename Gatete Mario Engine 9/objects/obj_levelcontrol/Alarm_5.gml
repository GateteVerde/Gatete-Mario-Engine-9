/// @description End P-Switch event

//If the switch event is active
if (pswitch_on == true) {
	
	//Stop P-Switch song
	if (gswitch_on == false) {
		
		audio_stop_sound(snd_pswitch);
	}
	
	//Deactivate event
	pswitch_event(true);
	
	//Reset P-Switch warning
	pswitch_warn = 0;
	
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
    else if (gswitch_on == false)
        alarm[0] = 2;
}