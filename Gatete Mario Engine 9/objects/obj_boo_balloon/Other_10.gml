/// @description Default death script

//Create dead object
imdead = instance_create_depth(x, y, -6, obj_enemy_dead);

//Hereby sprite
imdead.sprite_index = sprite_index;

//Hereby frame
imdead.image_index = image_index;

//Hereby facing direction
imdead.image_xscale = image_xscale;
imdead.image_yscale = image_yscale;

//Hereby ID horizontal speed
if (killer_id != -1) {
	
	//If the killer id is Mario
	if (killer_id == obj_mario)
		imdead.hspeed = obj_mario.xspeed;
	
	//Otherwise, if the killer id is the mega thwonk
	else if (killer_id == obj_megashroom_timer)
		imdead.hspeed = obj_megashroom_timer.xspeed * 2;
	
	//Otherwise, if the killer id is Mario spinning
	else if (killer_id == obj_mario_spinner) {
				
		//If Mario has any of the following powerups
		if (global.powerup == cs_raccoon)
		|| (global.powerup == cs_cape)
		|| (global.powerup == cs_tanooki)
		|| (global.powerup == cs_fraccoon)
		|| (global.powerup == cs_iraccoon) {
			
			//Set vertical speed
			imdead.vspeed = (swimming) ? -3 : -6;
	
			//If the kill object is at the left of this object
			if (killer_id.bbox_left + killer_id.bbox_right/2 < bbox_left + bbox_right/2)
				imdead.hspeed = 0.5;
			else if (killer_id.bbox_left + killer_id.bbox_right/2 > bbox_left + bbox_right/2)
				imdead.hspeed = -0.5;
		}
			
		//Otherwise
		else {
	
			//If the kill object is at the left of this object
			if (killer_id.bbox_left + killer_id.bbox_right/2 < bbox_left + bbox_right/2)
				imdead.hspeed = 1;
			else if (killer_id.bbox_left + killer_id.bbox_right/2 > bbox_left + bbox_right/2)
				imdead.hspeed = -1;
		}
	}
	
	//Otherwise, if killer exists
	else if (instance_exists(killer_id)) {
	
		//If the kill object is at the left of this object
		if (killer_id.bbox_left + killer_id.bbox_right/2 < bbox_left + bbox_right/2)
			imdead.hspeed = 1;
		else if (killer_id.bbox_left + killer_id.bbox_right/2 > bbox_left + bbox_right/2)
			imdead.hspeed = -1;
			
	//Otherwise, if killer no longer exists
	} else {
		
		// Set to random left or right speed
		imdead.hspeed = choose(-1, 1);	
	}
}

//Destroy
instance_destroy();