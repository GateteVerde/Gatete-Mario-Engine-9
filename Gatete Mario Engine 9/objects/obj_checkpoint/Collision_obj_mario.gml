/// @description Save the player position

if (ready == 0) {

    //Play 'Whistle' sound
    audio_play_sound(snd_whistle, 0, false);

    //Deactivate checkpoints
    with (obj_checkpoint) ready = 0;
    
    //Switch to the player flag
    ready = 1;
    
    //Sparkles
    event_user(0);
	
	//If Mario is tiny or small
	if (global.powerup == cs_small) {
	
		//Play 'Powerup' sound.
		audio_play_sound(snd_powerup, 0, false);
        
	    //Perform animation sequence
	    with (instance_create_depth(0, 0, -5, obj_mario_transform)) sequence = 0;

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