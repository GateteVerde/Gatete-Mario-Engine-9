/// @description Underwater Spiked Cheep-Cheep logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//Facing direction
	if (xspeed > 0) {
		
		xscale = 1;
		if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16)
			instance_destroy();
	}
	else if (xspeed < 0) {
	
		xscale = -1;
		if (x < camera_get_view_x(view_camera[0]))
			instance_destroy();
	}

	//Wave
	if (y > ystart)
	    yspeed -= 0.0125;
	else if (y < ystart)
	    yspeed += 0.0125;
#endregion
