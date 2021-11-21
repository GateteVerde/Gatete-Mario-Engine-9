///LIST of npc_behavior

function ai_npc_wall(freezeuponwall) {
	
	//Check for a platform
	platform_l = collision_rectangle(bbox_left+xspeed, bbox_top+1, bbox_left, bbox_bottom-4, obj_platformparent, 1, 0);
	platform_r = collision_rectangle(bbox_right, bbox_top+1, bbox_right+xspeed, bbox_bottom-4, obj_platformparent, 1, 0);
	
	//If moving right and there's a wall in position
	if (xspeed > 0)
	&& ((collision_rectangle(bbox_right, bbox_top+1, bbox_right+xspeed, bbox_bottom-4, obj_solid, 1, 0))
	|| ((platform_r) && (platform_r.issolid == true))) {
		
		//If the NPC can jump on walls
		if (freezeuponwall == -1) {
			
			//If there's no gravity, hop
			if (yadd == 0) {
			
				yadd = -4.5;
				y--;
			}
			
			//Move away from walls
			while (collision_rectangle(bbox_right+hspeed, bbox_top+4, bbox_right+hspeed, bbox_bottom-1, obj_solid, 0, 0))
			|| ((platform_r) && (platform_r.issolid == true))
		        x -= xspeed;  
		}
		
		//Otherwise
		else {
		
			//Stop horizontal movement or reverse movement
			xspeed = -(xspeed * freezeuponwall);
		
			//Prevent NPC from getting embed on the wall
			while (collision_rectangle(bbox_right, bbox_top+1, bbox_right, bbox_bottom-4, obj_solid, 1, 0))
				x--;
		}
	}
	
	//Otherwise, if moving left
	else if (xspeed < 0)
	&& ((collision_rectangle(bbox_left+xspeed, bbox_top+1, bbox_left, bbox_bottom-4, obj_solid, 1, 0))
	|| ((platform_l) && (platform_l.issolid == true))) {
		
		//If the NPC can jump on walls
		if (freezeuponwall == -1) {
			
			//If there's no gravity, hop
			if (yadd == 0) {
			
				yadd = -4.5;
				y--;
			}
			
			//Move away from walls
			while (collision_rectangle(bbox_left+hspeed, bbox_top+4, bbox_left+hspeed, bbox_bottom-1, obj_solid, 0, 0))
			|| ((platform_l) && (platform_l.issolid == true))
		        x += xspeed;  
		}
		
		//Otherwise
		else {
		
			//Stop horizontal movement or reverse movement
			xspeed = -(xspeed * freezeuponwall);
		
			//Prevent NPC from getting embed on the wall
			while (collision_rectangle(bbox_left, bbox_top+1, bbox_left, bbox_bottom-4, obj_solid, 1, 0))
				x++;
		}
	}
}

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