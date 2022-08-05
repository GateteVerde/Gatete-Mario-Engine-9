/// @description Big Boo logic

//If fading in
if (ready == 1) {

	alpha += 0.01;
	if (alpha > 1) {
	
		//Play 'Big Boo' sound
		audio_play_sound(snd_boo_big, 0, false);
		
		//Set frame
		image_index = 1;
		
		//End fade
		alpha = 1;
		ready = 2;
	}
}

//Otherwise, if fully faded
else if ((ready == 2) || (ready == 5)) {

	//If Mario does exist
	if (instance_exists(obj_mario)) {
	
		//If Mario is not dead or it's transforming
		if (!instance_exists(obj_mario_dead))
		&& (!instance_exists(obj_mario_transform)) {
			
			//Set position
			x = xstart + (96 * dsin(angle));
			y = ystart + (40 * dsin(angle) * dcos(angle));
		
			//Update angle
			angle += accel;
			if (angle > 360)
				angle = 0;
		}
	}
	
	//Accelerate
	accel += 0.01;
	if (accel > 1)
		accel = 1;
}

//Otherwise, if fading out
else if (ready == 4) {

	alpha -= 0.01;
	if (alpha < 0.1) {
	
		alpha = 0.1;
		ready = 5;
		alarm[1] = 240;
	}
}

#region ANIMATION

	//If not fully visible
	if ((ready != 2) && (ready != 5)) {
		
		//If the Boo has been hurt
		if (ready == 3) {
		
			//Set the hurt sprite
			sprite_index = spr_boo_big_hit;
			
			//Animate
			image_speed = 1;
		}
		
		//Otherwise
		else {
	
			sprite_index = spr_boo_big;
			image_speed = 0;
			image_index = 0;
		}
	}
	
	//Otherwise
	else {
		
		//If fully visible
		if (ready == 2) 
		&& (instance_exists(obj_mario)) {
	
			//If Mario is at the right
		    if (obj_mario.x > x+32) {
    
				//Set facing direction
				if (prevxscale != 1) 
				&& (sprite_index != spr_boo_big_turn) {
				
					//Set turning pose
					sprite_index = spr_boo_big_turn;
				
					//Animate
					image_speed = 1;
					image_index = 0;
				
					//Set scale
					prevxscale = 1;
				}
		    }
    
		    //Otherwise, if Mario is at the left
		    else if (obj_mario.x < x-32) {
			
				//Set facing direction
				if (prevxscale != -1) 
				&& (sprite_index != spr_boo_big_turn) {
				
					//Set turning pose
					sprite_index = spr_boo_big_turn;
				
					//Animate
					image_speed = 1;
					image_index = 0;
				
					//Set scale
					prevxscale = -1;
				}
		    }
		}
		
		//Otherwise, if fully faded
		else if (ready == 5) {
		
			//If Mario does not exist
			if (obj_mario.x < x-32) {
				
				xscale = -1;
				if (prevxscale != -1)
					prevxscale = -1;
			}
			
			//Otherwise
			else if (obj_mario.x > x+32) {
			
				xscale = 1;
				if (prevxscale != 1)
					prevxscale = 1;
			}
		}
	}
#endregion