/// @description Throwable brick logic

//If the brick is not held
if (!held) {

    //Previous horizontal speed
    prevxspeed = xspeed;
    
    //Inherit event
    event_inherited();
	
	//Check for 1 block gaps and blocks in the way
	event_user(5);
    
    //If kicked
    if (ready == 1) {
    
        //If the direction changes...
        if (sign(xspeed) != sign(prevxspeed)) {
			
			//If the block is outside
			if (outside_view() == false) {
			
				audio_play_sound(snd_bump, 0, false);
			}
			
			//Create shell thump
			with (instance_create_depth(x+(5*sign(prevxspeed)), y, -6, obj_shellthump)) bump = true;
            
            //Shatter if this is a blue or green brick
			if (sprite_index == spr_brick_blue_th) 
			|| (sprite_index == spr_brick_green_th) {
				
				//Shatter
				event_user(0);
				
				//Blow up if this is a green brick
				if (sprite_index == spr_brick_green_th)
					instance_create_layer(x, y, "Main", obj_explosion_lite);					
			}
        }
        
		//Destroy when outside the view
		if (outside_view() == true)
			instance_destroy();
    }
	
	//If the brick is no longer making contact with Mario, make the brick able to hurt Mario
	if (hurtplayer == 0)
	&& (ready == 1)
	&& (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0))
		hurtplayer = 1;
}

//Reset combo
if (yadd == 0)
&& (ready == 0)
	hitcombo = 0;

//No bouncing if kicked
if (ready == 1)
	bounces = -1;	