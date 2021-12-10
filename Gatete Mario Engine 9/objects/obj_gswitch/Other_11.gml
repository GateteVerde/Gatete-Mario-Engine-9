/// @description Press the switch

//Check if this switch is not pressed
if (sprite_index == spr_gswitch) {

    //Play 'Switch' song
    audio_play_sound(snd_switch, 0, false);
    
    //Change sprite
	sprite_index = spr_gswitch_press;
    
    //Destroy it
    alarm[0] = 60;
	
	//Stop Mario vertical speed
	obj_mario.yspeed = 0;
    
    //Activate switch events
    with (obj_levelcontrol) {
    
        //Reset warning
        gswitch_warn = 0;
        
        //Restart timer
        alarm[6] = 800;
        
        //Activate p-switch effect
        event_user(6);
    }
}