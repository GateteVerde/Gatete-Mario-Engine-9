/// @description Pidgit logic

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//If the timer is ready
	if (tready == 1) {
	
		//Update timer
		if (freeze == false) then t++;
		
		//If about to dive to the left
		if (move_ready == 1) {
		
			//Hover around before diving
			if (t < 40)
				xspeed -= 0.075;
			else if ((t >= 40) && (t < 120))
				xspeed += 0.075;
			else if ((t >= 120) && (t < 200))
				xspeed -= 0.075;
				
			//Dive
			if (t == 200) {
				
				//Ready to attack
				attack_ready = 1;
			
				//Set vertical speed
				yspeed = 3;
				
				//Set horizontal speed
				xspeed = -1.25;
			}
			
			//Ascend
			if ((t > 200) && (y > ystart))
				yspeed -= 0.05;
				
			//When back at it's original height, go back to hover state.
			else if ((t > 200) && (y < ystart)) {
			
				//Stop horizontal speed
				xspeed = 0;
				
				//Stop vertical speed
				yspeed = 0;
				y = ystart;
				
				//Stop attack
				attack_ready = false;
				
				//Restart timer
				t = 0;
				
				//Set movement
				move_ready = 2;
			}
		}
		
		//Otherwise, if about to dive to the right
		else if (move_ready == 2) {
		
			//Hover around before diving
			if (t < 40)
				xspeed += 0.075;
			else if ((t >= 40) && (t < 120))
				xspeed -= 0.075;
			else if ((t >= 120) && (t < 200))
				xspeed += 0.075;
				
			//Dive
			if (t == 200) {
				
				//Ready to attack
				attack_ready = 1;
			
				//Set vertical speed
				yspeed = 3;
				
				//Set horizontal speed
				xspeed = 1.25;
			}
			
			//Ascend
			if ((t > 200) && (y > ystart))
				yspeed -= 0.05;
				
			//When back at it's original height, go back to hover state.
			else if ((t > 200) && (y < ystart)) {
			
				//Stop horizontal speed
				xspeed = 0;
				
				//Stop vertical speed
				yspeed = 0;
				y = ystart;
				
				//Stop attack
				attack_ready = false;
				
				//Restart timer
				t = 0;
				
				//Set movement
				move_ready = 1;
			}
		}
		
		//Cap horizontal speed
		if (abs(xspeed) > 1.25)
			xspeed = 1.25 * sign(xspeed);
	}
#endregion

#region HOVERING

	//If not attacking
	if (attack_ready == 0) {
	
		hover++;
		if ((hover mod 5 = 0) && (hover < 20))
		    y++;
		else if ((hover mod 5 = 0) && ((hover > 20) && (hover < 40)))
		    y--;
			
		//Reset hover variable
		if (hover >= 40)
		    hover = 0
	}
#endregion

//Update carpet frame
cframe += 0.25;