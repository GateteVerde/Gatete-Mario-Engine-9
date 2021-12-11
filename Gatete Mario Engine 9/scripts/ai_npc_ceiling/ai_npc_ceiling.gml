/// @function ai_npc_ceiling(bounceuponceiling)
/// @param {bool} Reverse vertical direction?

function ai_npc_ceiling(bounceuponceiling) {
	
	//Check for a platform above
	var platform_u = collision_rectangle(bbox_left, bbox_top+yspeed, bbox_right, bbox_top+yspeed, obj_platformparent, 1, 0);
	
	//If moving upwards
	if (yspeed < 0) 
	&& ((collision_rectangle(bbox_left, bbox_top+yspeed, bbox_right, bbox_top+yspeed, obj_solid, 1, 0)) 
	|| ((platform_u) && (platform_u.issolid == true))) {
		
		//Check for a block above
		var block_u = collision_rectangle(bbox_left, bbox_top-2+yspeed/2, bbox_right, bbox_top, obj_blockparent, 0, 0);
		
		//If the object does bounce
		if (argument[0] == false) {
			
			//Prevent the NPC from getting stuck on a ceiling when jumping
			while (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_solid, 1, 0))
			|| ((platform_u) && (platform_u.issolid))
				y++;
		}
		
		//Bump block if there's one in position
		if (block_u) 
		&& (block_u.ready == 0) 
		&& (object_is_ancestor(object_index, obj_holdparent)) {
				
			with (block_u) {
						
				//Set state to bumped
				ready = 1;
						
				//Set horizontal speed
				vspeed = -2;
				alarm[0] = 4;
						
				//Create block specific events
				event_user(0);
				event_user(1);
			}
		}
		
		//Stops rising
		yspeed = -(yspeed * bounceuponceiling);
	}
}