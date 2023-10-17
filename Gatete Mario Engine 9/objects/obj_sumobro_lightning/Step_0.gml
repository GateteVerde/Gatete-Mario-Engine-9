/// @description Sumo Bro lightning logic

//Inherit the parent event
event_inherited();

//Blow if no gravity
if (yadd == 0) {

    //If visible, turn invisible and blow
    if (visible) {
		
		//If this bolt has been thrown by a cloudrus
		if (explode == 1) {
			
			instance_create_layer(x + 8, y, "Main", obj_explosion_lite);
			instance_destroy();
			exit;
		}
		
		//Otherwise
		else {
    
	        //Play 'Flames' sound
	        audio_play_sound(snd_flames, 0, false);
        
			//Create adyacent flames
	        alarm[0] = 20;
	        alarm[1] = 40;
        
	        //Turn invisible
	        visible = 0;
        
	        //Create smoke
	        instance_create_depth(x+8, y+8, -4, obj_smoke);
        
	        //Create flame in position
	        instance_create_depth(x, y+1, -2, obj_sumobro_flame);
		}
    }
}