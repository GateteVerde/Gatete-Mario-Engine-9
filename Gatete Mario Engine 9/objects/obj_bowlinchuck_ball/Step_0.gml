/// @description Bowlin' chuck's ball logic
	
//Previous horizontal speed
prevxspeed = xspeed;    

//Inherit event
event_perform_object(obj_physicsparent, ev_step, ev_step_normal);

//Anim speed
image_speed = 0.15 * sign(xspeed);
		
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
	
#region SLOPE COLLISION
                
	    //Check for a slope
	    slope_below = collision_rectangle(x-2, bbox_bottom+1, x+2, bbox_bottom+2, obj_slopeparent, 1, 0);
        
	    //If there's a slope below the player
	    if (slope_below) {
			
	        xspeed += slope_below.add/3;
		}
			
#endregion

//Destroy when outside
if (outside_view() == true) 
&& (y > camera_get_view_y(view_camera[0]))
    instance_destroy();