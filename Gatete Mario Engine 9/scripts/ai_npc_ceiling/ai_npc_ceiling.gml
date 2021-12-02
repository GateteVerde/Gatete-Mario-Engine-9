/// @function ai_npc_ceiling(bounceuponceiling)
/// @param {bool} Reverse vertical direction?

function ai_npc_ceiling(bounceuponceiling) {
	
	//Check for a platform above
	platform_u = collision_rectangle(bbox_left, bbox_top+yspeed, bbox_right, bbox_top+yspeed, obj_platformparent, 1, 0);
	
	//If moving upwards
	if (yspeed < 0) 
	&& ((collision_rectangle(bbox_left, bbox_top+yspeed, bbox_right, bbox_top+yspeed, obj_solid, 1, 0)) 
	|| ((platform_u) && (platform_u.issolid == true))) {
		
		if (argument[0] == false) {
			
			//Prevent the NPC from getting stuck on a ceiling when jumping
			while (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_solid, 1, 0))
			|| ((platform_u) && (platform_u.issolid))
				y++;
		}
		
		//Stops rising
		yspeed = -(yspeed * bounceuponceiling);
	}
}