/// @description Chicken Logic

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
				
				//Reduce horizontal speed
				xspeed = xspeed/2;
				
				//Set the vertical speed
				yspeed = 4 * dive;
			}
		}
	}
	
	//Otherwise, if the chicken is diving
	else {
	
		//If diving down
		if (dive == 1) {
		
			//Set the vertical speed
			yspeed -= 0.15;
			
			//If the chicken reached the ystart position, stop
			if (y < ystart) {

				//Stop vertical movement
				yspeed = 0;
				y = ystart;
				
				//End dive
				dive = 2;	
				
				//Double horizontal speed
				xspeed = xspeed*2;
			}
		}
		
		//Otherwise, if diving up
		else if (dive == -1) {
		
			//Set the vertical speed
			yspeed += 0.15;
			
			//If the chicken reached the ystart position, stop
			if (y > ystart) {
			
				//Stop vertical movement
				yspeed = 0;
				y = ystart;
				
				//End dive
				dive = -2;
				
				//Double horizontal speed
				xspeed = xspeed*2;
			}
		}
		
		//Animation
		if (abs(dive) != 2)
			image_speed = 1;
		else {
			
			image_speed = 0;
			image_index = 0;
		}
	}
#endregion

//Face towards direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;