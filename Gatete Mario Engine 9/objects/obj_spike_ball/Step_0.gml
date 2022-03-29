/// @description Spike's ball logic

//Destroy if the parent did not threw it
if (ready == 0)
&& (!instance_exists(parent)) {

    instance_create_depth(x, y+8, -4, obj_smoke);
    instance_destroy();
    exit;
}

//Otherwise, do default step
else if (ready > 0) {
	
	//Previous horizontal speed
	prevxspeed = xspeed;    

	//Inherit event
    event_inherited();

    //Phase through floors if not falling down
    if (ready == 1) {
		
		#region SOLID COLLISION
		
			//If the direction changes...
			if (sign(xspeed) != sign(prevxspeed)) {

			    //If the item is not outside
			    if (outside_view() == false) {
    
			        //Play 'Bump' sound
			        audio_play_sound(snd_bump, 0, false);
			    }
    
			    //Create shell thump
				with (instance_create_depth(x+(5*sign(prevxspeed)), y, -6, obj_shellthump)) bump = true;
				
				#region DIE
			
					//Create death object
					with (instance_create_depth(x, y, -6, obj_enemy_dead)) {
					
						sprite_index = other.sprite_index;
						image_index = other.image_index;
						image_xscale = other.xscale;
						hspeed = other.xspeed / 2;
					}
					
					//Destroy
					instance_destroy();

				#endregion
			}			
		#endregion
                
        //Check for a slope
        slope_below = collision_rectangle(x-2, bbox_bottom+1, x+2, bbox_bottom+2, obj_slopeparent, 1, 0);
        
        //If there's a slope below the player
        if (slope_below)
            xspeed += slope_below.add/3;
    }
        
    //Otherwise, set gravity
    else {
        
        //Gravity
        yadd = 0.2;
        
        //Cap vertical speed
        if (yspeed > 4)
            yspeed = 4;
    }
    
    //Set angle
    if (ready == 1)
        angle += (xspeed*6)*-1;
    else
        angle += (xspeed*12)*-1;
}

//Destroy when outside
if (outside_view() == true) 
&& (y > camera_get_view_y(view_camera[0]))
    instance_destroy();