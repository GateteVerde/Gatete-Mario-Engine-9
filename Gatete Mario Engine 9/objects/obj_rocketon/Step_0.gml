/// @description Rocketon Logic

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region DIVE

	//If the chicken didn't dive yet
	if (dive == 0) {
	
		//If Mario does exist
		if (instance_exists(obj_mario)) {
		
			//If Mario is 32 pixels nearby
			if (obj_mario.x > bbox_left-40)
			&& (obj_mario.x < bbox_right+40) {
			
				//Set diving direction
				dive = (obj_mario.y > y) ? 1 : -1;
				
				//Set the vertical speed
				yspeed = 2 * dive;
			}
		}
	}
	
	//Otherwise, if the chicken is diving
	else {
	
		//If diving down
		if (dive == 1) {
			
			//If the chicken reached the ystart position, stop
			if (y > ystart+48) {
				
				//Play 'Thud' sound
				audio_play_sound(snd_thud, 0, false);

				//Stop vertical movement
				y = ystart+48;
				yspeed = 0;
				
				//End dive
				dive = 2;
				
				//Shoot a bullet bill
				with (instance_create_depth(x, y+10, -2, obj_bulletbill)) {
				
					//Set frame
					image_index = 7;
					
					//Set vulnerabilities
					vulnerable = 100;
					stomp = 2;
					
					//Set motion
					xspeed = 2;
					yspeed = 2;
				}
			}
		}
		
		//Otherwise, if diving up
		else if (dive == -1) {
	
			
			//If the chicken reached the ystart position, stop
			if (y < ystart-48) {
				
				//Play 'Thud' sound
				audio_play_sound(snd_thud, 0, false);
			
				//Stop vertical movement
				y = ystart-48
				yspeed = 0;
				
				//End dive
				dive = -2;
				
				//Shoot a bullet bill
				with (instance_create_depth(x, y+10, -2, obj_bulletbill)) {
				
					//Set frame
					image_index = 1;
					
					//Set vulnerabilities
					vulnerable = 100;
					stomp = 2;
					
					//Set motion
					xspeed = 2;
					yspeed = -2;
				}
			}
		}
		
		//Animation
		if (dive == 2) || (dive == -2)
			image_index = 1;
		else
			image_index = 0;
	}
#endregion

//Face towards direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;