/// @description Kab-omb logic

//Inherit the parent event
event_inherited();

//Turn on ledges if allowed
turn_on_ledges = (charge == 1) ? 0 : 1;

//Increment palette animation
if (charge > 0) {
	
	//If the kab-omb is about to blow up
	if ((charge == 2) && (yadd == 0)) {
	
		//Set sprite
		sprite_index = spr_kabomb_th;
		
		//Stop horizontal speed
		xspeed = 0;
		
		//End charge
		charge = 3;
		alarm[1] = 60;
	}
	
	#region PALETTE
	
		pal += 0.2;
		if (pal > 1)
			pal = 0;	
	#endregion
	
	//If about to blow up
	if (charge > 1) {
				
		//If moving up
		if (charge == 3) {
			
			yadd = 0;
			xoffset = 0;
			yoffset = 0;
		}
		
		//Otherwise, set up offset
		else {
		
			xoffset = random_range(-2, 2);
			yoffset = random_range(-2, 0);
		}	
	}
}

//Set facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;