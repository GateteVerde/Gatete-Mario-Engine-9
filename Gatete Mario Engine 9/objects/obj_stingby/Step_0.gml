/// @description Stingby logic

//Manage pseudo movement variables
if (freeze == false) {

	//Update motion
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

#region MOVEMENT
	
	//If the enemy is not charging at Mario
	if (charge == 0) {
	
		//If the Stingby is moving to the right
		if (dir == 1) {
			
			//Set horizontal motion
			xspeed += 0.01;
			if (xspeed > 0.5) {
				
				xspeed = 0.5;
			}
			
			//Turn around
			if (x > xstart+40) 
				dir = -1;
		}
		
		//Otherwise, if the Stingby is moving to the right
		else if (dir == -1) {
		
			//Set horizontal motion
			xspeed += -0.01;
			if (xspeed < -0.5) {
			
				xspeed = -0.5;
			}
			
			//Turn around
			if (x < xstart-40)
				dir = 1;
		}
		
		#region WAVE MOTION
		
			if (y > ystart)
			    yspeed -= 0.0125;
			else if (y < ystart)
			    yspeed += 0.0125;
		#endregion
		
		#region FACING DIRECTION
		
			if (xspeed > 0)
				xscale = 1;
			else if (xspeed < 0)
				xscale = -1;
		#endregion
		
		//Start chasing Mario
		if ((dir == 1) && (xscale == 1) && (point_in_rectangle(obj_mario.x, obj_mario.y, x, y, x+64, y+64)))
		|| ((dir == -1) && (xscale == -1) && (point_in_rectangle(obj_mario.x, obj_mario.y, x-64, y, x, y+64))) {
			
			//Begin charge
			charge = 1;
			
			//Set jumping y position
			jumpyy = y;
			
			//Stop moving horizontally
			xspeed = 0;
			
			//Perform small jump
			yspeed = -3;
			yadd = 0.2;
		}
	}
	
	//Otherwise if the Stingby detected Mario, do a little jump before charging at him.
	else if (charge == 1) {
		
		//If the stingby is moving down
		if (y > jumpyy) {
			
			//Do charge at Mario
			charge = 2;
		
			//Stay in position
			y = jumpyy;
			
			//Stop vertical motion
			yadd = 0;
			yspeed = 0.5;
		}	
	}
	
	//Otherwise if the Stingby is charging at Mario
	else if (charge == 2) {
	
		//If the Stingby is facing right
		if (dir == 1) {
		
			//Set horizontal motion
			xspeed += 0.02;
			if (xspeed > 1) {
				
				xspeed = 1;
			}
		}
		
		//Otherwise if the Stingby is facing left
		else if (dir == -1) {
		
			//Set horizontal motion
			xspeed += -0.02;
			if (xspeed < -1) {
				
				xspeed = -1;
			}		
		}
		
		#region WAVE MOTION
		
			if (y > ystart)
			    yspeed -= 0.0125;
			else if (y < ystart)
			    yspeed += 0.0125;
		#endregion
		
		//If Mario is far away, end charging
		if (point_distance(obj_mario.x, obj_mario.y, x, y) > 128)
			charge = 0;
	}
	
#endregion
