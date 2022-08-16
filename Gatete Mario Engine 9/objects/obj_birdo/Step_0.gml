/// @description Birdo logic

//Inherit the parent event
event_inherited();

#region LOGIC

	#region MOVEMENT
	
		//If moving right
		if (dir == 1) {

			//If Birdo passes through the start position
			if (x > xstart) {
	
				//Stop moving and snap into position
				x = xstart;
				xspeed = 0;
		
				//Stop animation
				image_speed = 0;
		
				//Replace dir
				dir = -dir;
		
				//Move again
				alarm[10] = 90;
			}
		}

		//Otherwise, if moving left
		else if (dir == -1) {

			//If Birdo goes too far to the left
			if (x < xstart-40) {
	
				//Stop moving and snap into position
				x = xstart-40;
				xspeed = 0;
		
				//Stop animation
				image_speed = 0;
		
				//Replace dir
				dir = -dir;
		
				//Move again
				alarm[10] = 90;		
			}
		}
	#endregion
	
	#region JUMPING
	
		//If Birdo is jumping
		if (jumping == 1) {
		
			//If Birdo lands on the floor, resume movement
			if (yadd == 0) {
				
				//Resume animation
				image_speed = 1;
			
				//End jumping
				jumping = 0;
				
				//Move again
				xspeed = 0.5 * dir;
			}
		}
		
		//Gravity
		yadd = 0.15;
	#endregion
	
	//Set pick up flag
	if (bowtie == 1)
		isheavy = 0;
	else
		isheavy = 2;
	
#endregion

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;