/// @description One-Way Gate logic

//If not longer bumped, reset angle
if (ready != 1)
	angle = 0;
else {
	
	angle = random_range(-3, 3);
	if (!audio_is_playing(snd_oneway))
		ready = 2;
}

//Manage collision with Mario and NPCs
#region MARIO AND NPC COLLISIONS

	//Create a list
	var list = ds_list_create();
		
	//If the angle is set to 0, prevent Mario and NPCs from going into the opposite direction
	if (image_angle == 0) {
			
		//If Mario does exist
		if (instance_exists(obj_mario)) {

			//With Mario
			with (obj_mario) {
	
				//If Mario's moving to the left
				if (xspeed < 0)
				&& (collision_rectangle(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, other.id, 1, 0)) {
			
					//Prevent Mario from getting embed
					while (collision_rectangle(bbox_right, bbox_top, bbox_left, bbox_bottom, other.id, 1, 0)) {
				
						x++;
					}
		
					//Stop horizontal speed and play 'Oneway' sound if not bumped
					xspeed = 0;
					if (other.ready == 0) {
	
						other.ready = 1;
						audio_play_sound(snd_oneway, 0, false);
					}
				}
			}
		}

		//Count items
		var count = collision_rectangle_list(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, obj_physicsparent, 1, 0, list, 0);
		if (count > 0) {

			//Iterate through all items
			for (var i=0; i<count; i++) {
	
				if (list[| i].xspeed < 0) 
				&& (collision_rectangle(list[| i].bbox_left, list[| i].bbox_top, list[| i].bbox_left, list[| i].bbox_bottom, other.id, 1, 0)) {
		
					//Prevent NPCs from getting embed
					while (collision_rectangle(list[| i].bbox_left, list[| i].bbox_top, list[| i].bbox_left, list[| i].bbox_bottom, other.id, 1, 0)) {
				
						list[| i].x++;
					}
		
					//Stop, destroy or turn towards
					if (list[| i].turn_toward != 1) {
					
						list[| i].xspeed = 0;
						if (other.ready == 0) {
	
							other.ready = 1;
							if (!outside_view())
								audio_play_sound(snd_oneway, 0, false);
						}
					}
					else {
					
						list[| i].xspeed = -list[| i].xspeed;
						if (other.ready == 0) {
	
							other.ready = 1;
							if (!outside_view())
								audio_play_sound(snd_oneway, 0, false);
						}
					}
					
					//Destroy if required
					with (list[| i]) event_user(0);
				}
			}
		}				
	}
	
	//Otherwise, the angle is set to 90
	else if (image_angle = 90) {
		
		#region PLAYER
		
			//Check for the player
			var player = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

			//If the player exists
			if (player)
			&& (player.state != playerstate.jump)
			&& (player.bbox_bottom < yprevious+5) {
			
				//If not bumped
				if (ready == 0) {
	
					ready = 1;
					audio_play_sound(snd_oneway, 0, false);
				}
			}
		
		#endregion
		
		//Count items
		var count = collision_rectangle_list(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_physicsparent, 1, 0, list, 0);
		if (count > 0) {
		
			//Iterate through all items
			for (i=0; i<count; i++) {
			
				if (list[| i].yadd == 0)
				&& (list[| i].bbox_bottom < yprevious+5) {
					
					//If not bumped
					if (ready == 0) {
	
						ready = 1;
						if (!outside_view())
							audio_play_sound(snd_oneway, 0, false);
					}				
				}
			}
		}
	}
		
	//Otherwise, if the angle is set to 180
	else if (image_angle == 180) {
			
		//With Mario
		with (obj_mario) {
	
			//If Mario's moving to the right
			if (xspeed > 0)
			&& (collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, other.id, 1, 0)) {
			
				//Prevent Mario from getting embed
				while (collision_rectangle(bbox_right, bbox_top, bbox_right, bbox_bottom, other.id, 1, 0)) {
				
					x--;
				}
		
				//Stop horizontal speed and play 'Oneway' sound if not bumped
				xspeed = 0;
				if (other.ready == 0) {
	
					other.ready = 1;
					audio_play_sound(snd_oneway, 0, false);
				}
			}
		}

		//Count items
		var count = collision_rectangle_list(bbox_left-1, bbox_top, bbox_left, bbox_bottom, obj_physicsparent, 1, 0, list, 0);
		if (count > 0) {

			//Iterate through all items
			for (var i=0; i<count; i++) {
	
				if (list[| i].xspeed > 0) 
				&& (collision_rectangle(list[| i].bbox_right, list[| i].bbox_top, list[| i].bbox_right, list[| i].bbox_bottom, other.id, 1, 0)) {
		
					//Prevent NPCs from getting embed
					while (collision_rectangle(list[| i].bbox_right, list[| i].bbox_top, list[| i].bbox_right, list[| i].bbox_bottom, other.id, 1, 0)) {
				
						list[| i].x--;
					}
		
					//Stop or turn towards
					if (list[| i].turn_toward != 1) {
					
						list[| i].xspeed = 0;
						if (other.ready == 0) {
	
							other.ready = 1;
							if (!outside_view())
								audio_play_sound(snd_oneway, 0, false);
						}
					}
					else {
					
						list[| i].xspeed = -list[| i].xspeed;
						if (other.ready == 0) {
	
							other.ready = 1;
							if (!outside_view())
								audio_play_sound(snd_oneway, 0, false);
						}
					}
					
					//Destroy if required
					with (list[| i]) event_user(0);
				}
			}
		}
	}
	
	//Otherwise, if the angle is set to 270
	else if ((image_angle == -90) || (image_angle == 270)) {
			
		with (obj_mario) {
		
			//If moving upwards
			if (yspeed < 0) 
			&& (collision_rectangle(bbox_left, bbox_top+yspeed/2, bbox_right, bbox_top, other.id, 1, 0)) { 
	
				//Prevent the player from getting stuck on a ceiling when jumping/climbing
				if (state > 1) {
			
					while (collision_rectangle(bbox_left, bbox_top+1, bbox_right, bbox_top+1, other.id, 1, 0))
						y++;
				}
		
				//Stop vertical movement
				if ((flying) && (global.powerup == cs_cape)) {
			
					if (yspeed < 0) {
				
						memory_yspeed = yspeed;
					}
				}
				yspeed = 0;
				if (other.ready == 0) {
	
					other.ready = 1;
					audio_play_sound(snd_oneway, 0, false);
				}
		
				//If the player does not have the frog/penguin powerups and it's not climbing
				if ((state < 3)
				&& !(flying && global.powerup == cs_cape)
				&& (noisy == false)) {
		
					//Max out bee powerup flight timer
					if (global.powerup == cs_bee) {
			
						beefly = 128;
					}
			
					//Stop variable jump
					jumping = 2;
			
					//Play 'Bump' sound
					if (!audio_is_playing(snd_bump))
						audio_play_sound(snd_bump, 0, false);
				}
			}
		}
		
		//Count items
		var count = collision_rectangle_list(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_physicsparent, 1, 0, list, 0);
		if (count > 0) {

			//Iterate through all items
			for (var i=0; i<count; i++) {
			
				//If moving upwards
				if (list[| i].yspeed < 0) 
				&& (collision_rectangle(list[| i].bbox_left, list[| i].bbox_top+list[| i].yspeed/2, list[| i].bbox_right, list[| i].bbox_top, other.id, 1, 0)) {
		
					if (list[| i].turn_toward_ceiling == true) {
			
						//Prevent the NPC from getting stuck on a ceiling when jumping
						while (collision_rectangle(list[| i].bbox_left, list[| i].bbox_top, list[| i].bbox_right, list[| i].bbox_top, obj_solid, 1, 0))
							y++;
					}
		
					//Stops rising
					list[| i].yspeed = -(list[| i].yspeed * list[| i].turn_toward_ceiling);
					if (other.ready == 0) {
	
						other.ready = 1;
						if (!outside_view())
							audio_play_sound(snd_oneway, 0, false);
					}
				}
			}
		}
	}
	
	//Destroy the list
	ds_list_destroy(list);
	
#endregion

//Allow bump
if (ready == 2)
&& (!collision_rectangle(bbox_left-2, bbox_top-2, bbox_right+2, bbox_bottom+2, obj_mario, 0, 0))
&& (!collision_rectangle(bbox_left-2, bbox_top-2, bbox_right+2, bbox_bottom+2, obj_physicsparent, 0, 0))
	ready = 0;