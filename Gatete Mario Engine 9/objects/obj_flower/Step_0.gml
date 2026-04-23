/// @description Flower logic logic

//If the item is frozen
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region SCALE / MOTION

	//Hereby scale
	image_xscale = scale;
	image_yscale = scale;

	//Increase scale
	scale += 0.0324;
	if (scale > 1) {
		
		//Prevent scaling up
		scale = 1;
	}
	
	//Slowdown horizontal speed
	xspeed = max(0.05, abs(xspeed)-0.05)*sign(xspeed);
	
	//Do a float movement
	yspeed -= 0.1;
	if (yspeed < -4)
		yspeed = -4;

#endregion

//Destroy when outside the view
if (outside_view() == true)
	instance_destroy();