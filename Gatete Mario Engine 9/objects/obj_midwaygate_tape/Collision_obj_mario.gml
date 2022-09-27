/// @description Save the player position

if (image_index == 0) {

    //Play 'Whistle' sound
    audio_play_sound(snd_whistle, 0, false);

    //Deactivate checkpoint flags
    with (obj_checkpoint) ready = 0;
	
	//Deactivate midway bells
	with (obj_bell_midway) {
		
		image_speed = 0;
		image_index = 0;
	}
	
	//Deactivate midway gate tapes
	with (obj_midwaygate_tape) {
	
		visible = 1;
		if (image_index != 0)
			image_index = 0;
	}
    
    //Change into the broken tape
	image_index = 1;
	
	//If HP mode is not active
	if (global.hp_mode == false) {
	
		//If Mario is small, turn into Big Mario
		if (global.powerup == cs_small)
		    global.powerup = cs_big;
	}
	
	//Otherwise
	else {
	
		//Restore all health
		if (global.hp < global.hp_max)
			global.hp = global.hp_max;
	}
    
    //Remember checkpoint
    global.checkpoint = id;
    global.checkpointroom = room;
    
    //Save collected star coins
    for (var i = 0; i < 3; i++) {
    
        if (ds_map_find_value(global.sc[i], global.level) == 1)
            ds_map_replace(global.sc[i], global.level, 2);
    }
}