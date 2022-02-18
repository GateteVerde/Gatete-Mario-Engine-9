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
	
	//If Mario is tiny or small
	if (global.powerup == cs_small) {

	    //Turn Mario into 'Super' Mario.
	    global.powerup = cs_big;
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