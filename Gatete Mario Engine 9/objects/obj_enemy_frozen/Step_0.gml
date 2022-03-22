/// @description Throwable brick logic

//Animate ice block
if (anim == true) {

	anim_b += 0.15;
	if (anim_b > 4) {
		
		anim = 0;
		anim_b = 0;
		alarm[3] = 60 + random(round(120));
	}
}

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
			
			//Get 200 points
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, bbox_top, -4, obj_score)) value = 200;
				
			//Shatter
			event_user(0);
        }
        
		//Destroy when outside the view
		if (outside_view() == true)
			instance_destroy();
    }
}

//No offset or bouncing if kicked
if (ready == 1) {
	
	bounces = -1;
	if (offset != 0)
		offset = 0;
}