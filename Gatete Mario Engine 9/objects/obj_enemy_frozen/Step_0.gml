/// @description Throwable brick logic

//If the brick is not held
if (!held) {

    //Previous horizontal speed
    prevxspeed = xspeed;
    
    //Inherit event
    event_inherited();
    
    //If kicked
    if (ready == 1) {
		
		//Reset offset
		offset = 0;
    
        //If the direction changes...
        if (xspeed != prevxspeed) {
			
			//If the block is outside
			if (outside_view() == false) {
			
				audio_play_sound(snd_bump, 0, false);
			}
			
			//Create shell thump
			with (instance_create_depth(x+(5*sign(prevxspeed)), y, -6, obj_shellthump)) bump = true;
				
			//Shatter
			event_user(0);
        }
        
		//Destroy when outside the view
		if (outside_view() == true)
			instance_destroy();
    }
}

//No bouncing if kicked
if (ready == 1)
	bounces = -1;	