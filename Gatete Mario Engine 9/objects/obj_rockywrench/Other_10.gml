/// @description Default death script

//Create dead object
imdead = instance_create_depth(x, y, depth, obj_enemy_dead);

//Hereby sprite
imdead.sprite_index = spr_rockywrench_dead;

//Hereby frame
imdead.image_index = image_index;

//Hereby facing direction
imdead.image_xscale = xscale;

//Hereby ID horizontal speed
if (killer_id != -1) {

	//If the "xspeed" variable exists
	if (variable_instance_exists(killer_id, "xspeed")) {
	
		//If the enemy killer object does not have horizontal speed
		if (killer_id.xspeed == 0) {
	
			//If the kill object is at the left of this object
			if (killer_id.bbox_left + killer_id.bbox_right/2 < bbox_left + bbox_right/2)
				imdead.hspeed = 1;
			else if (killer_id.bbox_left + killer_id.bbox_right/2 > bbox_left + bbox_right/2)
				imdead.hspeed = -1;
		}
	
		//Otherwise
		else {
	
			//If the killer id is Mario
			if (killer_id == obj_mario)
				imdead.hspeed = obj_mario.xspeed;
			
			//Otherwise
			else {
			
				//If the killer id is not the mega mushroom
				if (killer_id.object_index == obj_megashroom_timer)
					imdead.hspeed = obj_megashroom_timer.xspeed * 2;

				//Otherwise
				else {
					
					if (killer_id.xspeed > 0)
						imdead.hspeed = 1;
					else if (killer_id.xspeed < 0)
						imdead.hspeed = -1;
				}
			}
		}
	}
}

//Destroy
instance_destroy();