/// @description Bomb Cheep-Cheep logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//If not ready
	if (ready == 0) {

		#region BEHAVIOUR
		
			//Wall collision
			ai_npc_wall(1);

			//If the cheep cheep is moving to the right.
			if (xspeed > 0) {

			    //Change direction
			    if (x > xstart+64)
			        xspeed = -xspeed;
			}

			//Otherwise, if the cheep cheep is moving to the left.
			else if (xspeed < 0) {
        
			    //Change direction.
			    if (x < xstart-64)    
			        xspeed = -xspeed;
			}
			
		#endregion
		
		//Check for Mario
		var mario = collision_circle(x, y, 48, obj_mario, 1, 0);
		if (mario) {
			
			//Stop moving horizontally
			xspeed = 0;
			
			//Activate
			ready = 1;
		
			//Start flashing
			alarm[0] = 1;
			
			//Detonate
			alarm[1] = 120;
		}
	}

	//Wave
	if (y > ystart)
	    yspeed -= 0.0125;
	else if (y < ystart)
	    yspeed += 0.0125;
#endregion

//Facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;
