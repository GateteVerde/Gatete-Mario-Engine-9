/// @function ai_npc_wall(freezeuponwall)
/// @param {real} freezeuponwall What will the enemy do after bumping a wall? (-1: Jump it, 0: Ignore wall, 1: Turn around)

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
			
				yspeed = (swimming) ? -2.5 : -5;
				y--;
			}
			
			//Move away from walls
			while (collision_rectangle(bbox_right, bbox_top+4, bbox_right+xspeed, bbox_bottom-1, obj_solid, 0, 0))
			|| ((platform_r) && (platform_r.issolid == true))
		        x--;  
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
			
				yspeed = (swimming) ? -2.5 : -5;
				y--;
			}
			
			//Move away from walls
			while (collision_rectangle(bbox_left+xspeed, bbox_top+4, bbox_left, bbox_bottom-1, obj_solid, 0, 0))
			|| ((platform_l) && (platform_l.issolid == true))
		        x++;  
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