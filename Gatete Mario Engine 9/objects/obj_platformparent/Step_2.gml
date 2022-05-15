/// @description Player and NPC logic (While in-platform)

//Player / NPC Ride logic
#region RIDE LOGIC

	//Check for the player
	var player = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

	//If the player exists
	if (player)
	&& (player.bbox_bottom < yprevious+5)
	&& (player.state != playerstate.jump) {
		
		//Check there's no semisolid on the way
		var check = collision_line(obj_mario.bbox_left, bbox_top-5, obj_mario.bbox_right, bbox_top+1, obj_semisolid, 0, 1);
		var check2 = collision_line(obj_mario.bbox_left, bbox_top-5, obj_mario.bbox_right, bbox_top+1, obj_slopeparent, 1, 1);
		
		//If there's a platform on the way, exit
		if (!check) 
		&& (!check2) {
    
		    //Snap the player vertically
		    player.y = ceil(bbox_top-15);
			
			//If the platform can transport Mario horizontally
			if (no_horiz == false) {

			    //Snap the player horizontally
			    player.x += x-xprevious;
			    if (collision_rectangle(player.bbox_right, player.bbox_top+4, player.bbox_right+1, player.bbox_bottom-1, obj_solid, 1, 1))
			        player.x--;
			    else if (collision_rectangle(player.bbox_left-1, player.bbox_top+4, player.bbox_left, player.bbox_bottom-1, obj_solid, 1, 1))
			        player.x++;
			}
		}
	}

	//Create a list
	var list = ds_list_create();

	//Count items
	var count = collision_rectangle_list(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_physicsparent, 0, 0, list, 0);
	if (count > 0) {

		//Iterate through all items
		for (var i=0; i<count; i++) {
		
			//If the item is above this platform
			if (list[| i].yspeed >= 0)
			&& (list[| i].ignore_platforms == false)
			&& (list[| i].bbox_bottom < yprevious+5) {
				
				//If there's a platform on the way, ignore this event
				if (!collision_rectangle(list[| i].bbox_left, bbox_top-5, list[| i].bbox_right, bbox_top+1, obj_semisolid, 0, 1)) {
	
				    //Snap the player vertically
				    list[| i].y = ceil(bbox_top-16);
					
					//If the platform can transport NPCs horizontally
					if (no_horiz == false) {

					    //Snap the player horizontally
					    list[| i].x += x-xprevious;
					    if (collision_rectangle(list[| i].bbox_right, list[| i].bbox_top+4, list[| i].bbox_right+1, list[| i].bbox_bottom-1, obj_solid, 1, 1))
					        list[| i].x--;
					    else if (collision_rectangle(list[| i].bbox_left-1, list[| i].bbox_top+4, list[| i].bbox_left, list[| i].bbox_bottom-1, obj_solid, 1, 1))
					        list[| i].x++;
					}
				}
			}
		}
	}

	//Destroy list
	ds_list_destroy(list);
#endregion

//If this platform is solid
if (issolid == true) {
	
	//If Mario does exist
	if (instance_exists(obj_mario)) {
	
		//With Mario
		with (obj_mario) {
		
			//If moving right and this platform is on the way
			if (xspeed > 0)
			&& (((global.powerup != cs_tiny) && (collision_rectangle(bbox_right, bbox_top+4, bbox_right+1, bbox_bottom+ismega, other.id, 1, 0)))
			|| ((global.powerup == cs_tiny) && (collision_rectangle(bbox_right, bbox_top, bbox_right+1, bbox_bottom-5, other.id, 1, 0)))) {
			       
		        //Stop horizontal speed
		        xspeed = 0;
				
				//If Mario does not have the tiny powerup
				if (global.powerup != cs_tiny) {
            
			        //Prevent the player from getting embed on the wall
			        while (collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom+ismega, other.id, 0, 0))
			        && (!collision_point(x, bbox_top+4, other.id, 0, 0))
			            x--;
				}
				else {
					
			        //Prevent the player from getting embed on the wall
			        while (collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom-5, other.id, 0, 0))
			        && (!collision_point(x, bbox_top+4, other.id, 0, 0))
			            x--;					
				}
			}
			
			//Otherwise, if moving left and this platform is on the way
			else if (xspeed < 0)
			&& (((global.powerup != cs_tiny) && (collision_rectangle(bbox_left-1, bbox_top+4, bbox_left, bbox_bottom+ismega, other.id, 1, 0)))
			|| ((global.powerup == cs_tiny) && (collision_rectangle(bbox_left-1, bbox_top, bbox_left, bbox_bottom-5, other.id, 1, 0)))) {
			
		        //Stop horizontal speed
		        xspeed = 0;
				
				//If the player is not tiny
				if (global.powerup != cs_tiny) {
            
			        //Prevent the player from getting embed on the wall
			        while (collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom+ismega, other.id, 0, 0))
			        && (!collision_point(x, bbox_top+4, other.id, 0, 0))
			            x++;
				}
				else {
				
			        //Prevent the player from getting embed on the wall
			        while (collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom-5, other.id, 0, 0))
			        && (!collision_point(x, bbox_top+4, other.id, 0, 0))
			            x++;					
				}
			}
			
			//If Mario is moving up
		    if (yspeed < 0) 
		    && (collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top, other.id, 1, 0)) {
        
		        //Prevent the player from getting embed on a ceiling
		        if (state > playerstate.walk) {
            
		            while (collision_rectangle(bbox_left, bbox_top+1, bbox_right, bbox_top+1, other.id, 0, 0))
		                y++;
		        }
            
		        //Stop vertical movement
		        yspeed = 0;
            
		        //Play 'Bump' sound if not climbing
		        if (state == playerstate.jump)
		            audio_play_sound(snd_bump, 0, false);
		    }
		}
		
		//Make sure if Mario is below the block
		if (obj_mario.y > y-11) {
    
		    //If moving down
		    if (y-yprevious > 0) {
        
		        //With Mario
		        with (obj_mario) {
            
		            //If Mario is below the platform
					if (other.vspeed > 0) {
						
						while (collision_rectangle(bbox_left, bbox_top-1+other.id.vspeed, bbox_right, bbox_top, other.id, 0, 0))
							y += other.id.vspeed;
					}
		        }
		    }
			
			//If Mario is walljumping
			if (obj_mario.wallkick == 1) {
			
				if ((x-xprevious != 0) 
				&& (collision_rectangle(obj_mario.bbox_left - 5, obj_mario.bbox_top+4, obj_mario.bbox_right + 5, obj_mario.bbox_bottom, other.id, 1, 0))) {
					
					obj_mario.x += x-xprevious;
					if (y-yprevious != 0)
						obj_mario.y += y-yprevious;
				}
			}
			
			//Otherwise
			else {

			    //Push Mario in the direction the platform moves    
			    if ((x-xprevious < 0) && (collision_rectangle(bbox_left-2-(x-xprevious), bbox_top+4, bbox_left-2, bbox_bottom-1, obj_mario, 0, 0)))
			    || ((x-xprevious > 0) && (collision_rectangle(bbox_right+2, bbox_top+4, bbox_right+2+(x-xprevious), bbox_bottom-1, obj_mario, 0, 0)))
			        obj_mario.x += x-xprevious;
			}
		}
	}
	
	//Push NPCs horizontally
	#region NPC PUSH
	
		//Create list
		var list_j = ds_list_create();
		
		//Count instances
		var count_j = collision_rectangle_list(bbox_left, bbox_top+4, bbox_right, bbox_bottom-1, obj_physicsparent, 0, 0, list_j, 0);
		if (count_j > 0) {
			
			for (var j=0; j<count_j; j++) {
				
				//If the NPC is below the top boundary
				if (list_j[| j].bbox_bottom > yprevious+5) 
				&& (list_j[| j].bbox_bottom < bbox_bottom) {
				
					//Push it
					if ((x-xprevious < 0) && (collision_rectangle(bbox_left-2, bbox_top+4, bbox_left, bbox_bottom, list_j[| j], 0, 0)))
					|| ((x-xprevious > 0) && (collision_rectangle(bbox_right, bbox_top+4, bbox_right+2, bbox_bottom, list_j[| j], 0, 0)))
						list_j[| j].x += x-xprevious;
				}
			}
		}
		
		//Destroy list
		ds_list_destroy(list_j);
	#endregion
}