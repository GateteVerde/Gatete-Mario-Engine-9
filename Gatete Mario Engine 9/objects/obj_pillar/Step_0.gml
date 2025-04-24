/// @description Pillar logic

//Freeze if needed
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//Slam into the ground
	if ((ready == 1) && (y > ystart-4)) {

		//Play 'Thud' sound
		audio_play_sound(snd_thud, 0, false);
	
		//Stop vertical movement
		yspeed = 0;
		y = ystart;
	
		//Wait
		ready = 2;
		alarm[2] = 60;
	}

	//Stop after returning to the top, and restart the sequence
	else if ((ready == 2) && (y < ystart - 191)) {

		//Stop vertical movement
		yspeed = 0;
		y = ystart - 192;
	
		//Wait
		ready = 0;
		alarm[0] = 100;
	}
#endregion

//Collision with Mario
with (obj_mario) {

	//If Mario's moving to the left
	if (xspeed < 0)
	&& (collision_rectangle(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, other.id, 1, 0)) {
			
		//Prevent Mario from getting embed
		while (collision_rectangle(bbox_right, bbox_top, bbox_left, bbox_bottom, other.id, 1, 0)) {
				
			x++;
		}
		
		//Stop Mario's horizontal speed
		xspeed = 0;
	}
	
	//Otherwise, if Mario's moving to the right
	else if (xspeed > 0)
	&& (collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, other.id, 1, 0)) {
			
		//Prevent Mario from getting embed
		while (collision_rectangle(bbox_right, bbox_top, bbox_right, bbox_bottom, other.id, 1, 0)) {
				
			x--;
		}
		
		//Stop Mario's horizontal speed
		xspeed = 0;
	}
	
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