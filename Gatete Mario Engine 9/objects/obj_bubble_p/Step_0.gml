/// @description Bubble logic

//If the item is frozen
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region SCALE / MOTION

	//Increase scale
	scale += 0.0324;
	if (scale > 1) {
		
		//Prevent scaling up
		scale = 1;
		
		//Trigger bubble functions
		if (ready == 0) {
			
			ready = 1;
			alarm[0] = 240;
			alarm[1] = 360;
		}
	}
	
	//Do a float movement
	yspeed += (y < ystart) ? 0.01 : -0.01;

	//Slowdown horizontal speed
	xspeed = max(0.25, abs(xspeed)-0.025)*sign(xspeed);

#endregion

//Destroy when outside the view
if (outside_view())
	instance_destroy();