/// @description Lightning volt logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//No swimming
swimming = false;

//No gravity
yadd = 0;

#region WALL COLLISION

	//Check for walls
	var wall_l = collision_rectangle(bbox_left-1, bbox_top, bbox_left, bbox_bottom, obj_solid, 1, 0);
	var wall_r = collision_rectangle(bbox_right, bbox_top, bbox_right+1, bbox_bottom, obj_solid, 1, 0);

	//If moving horizontally
	if ((xspeed < 0) && ((wall_l) && (wall_l.object_index != obj_slopeparent_ceiling)))
	|| ((xspeed > 0) && ((wall_r) && (wall_r.object_index != obj_slopeparent_ceiling)))
		event_user(0);
#endregion

#region FLOOR / CEILING COLLISION

	//When moving down
	if (yspeed > 0) {

	    //Check for a semisolid below
	    var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
    
	    //If the semisolid exists, snap above it.
	    if (semisolid)
	    && (bbox_bottom < semisolid.yprevious+5)
	        event_user(0);
	}
	
	//When moving up
	if (yspeed <= 0) {
		
		//Check for a ceiling
		var ceiling = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 1, 0);
		
		//If a ceiling exists
		if (ceiling) {
		
			//If this is not a sloped ceiling
			if (ceiling.object_index == obj_solid)
				event_user(0);
				
			//Otherwise
			else {
				
				//If bouncing is allowed
				if (allow_bounce == 1) {
				
				    //If not moving vertically.
				    if (yspeed == 0) {
    
				        //If moving to the right
				        if (xspeed > 0) {
						
							//Move downwards
				            xspeed = 0;
				            yspeed = 6;
				        }
        
				        //Otherwise, if moving to the left
				        else {
        
				            //Move downwards
				            xspeed = 0;
				            yspeed = 6;
				        }
				    }
				    else {
						
						if ((variable_instance_exists(ceiling, "dir")) && (dir != 0)) {

					        xspeed = 6*sign(ceiling.dir);
					        yspeed = 0;
						}
						else
							event_user(0);
				    }
    
				    //Bounce
					alarm[1] = 3;
				    allow_bounce = 0;
    
				    //Snap into the slope
					if (ceiling.sprite_width < 17) {
					
						x = ceiling.x + 8;
						y = ceiling.y + 8;
					}
					else
						move_snap(8, 8);
				}
			}
		}
	}
#endregion

//Collision with bricks
var brick = collision_rectangle(bbox_right, bbox_top, bbox_right+xspeed, bbox_bottom, obj_brick, 0, 0);

if (brick) {

	//Play 'Bump' sound
	audio_play_sound(snd_bump, 0, false);

	//Get 10 points
	score += 10;

	//Destroy brick
	with (brick) event_user(1);

	//Destroy
	event_user(0);
}