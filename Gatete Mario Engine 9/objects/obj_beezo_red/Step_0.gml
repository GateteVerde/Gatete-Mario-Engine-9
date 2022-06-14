/// @description Red Beezo logic

//Manage pseudo movement variables
if (freeze == false) {

	//Handle horizontal motion
	x += xspeed;
	y += yspeed;
}

#region SLOWDOWN

	//If not slowing down
	if (slowdown == 0) {

		if (instance_exists(obj_mario))
		&& (y > obj_mario.y-40)
			slowdown = 1;
	}
	
	//Otherwise, slowdown vertically
	else if (slowdown == 1) {
	
		//Slow down vertically
		yspeed = max(0, abs(yspeed)-0.025)*sign(yspeed);
		if (abs(yspeed) < 0.025) {
		
			//Stop vertically
			yspeed = 0;
			
			//End slowdown
			slowdown = 2;
			
			//Set horizontal speed
			xspeed = 2 * sign(xscale);
		}
	}
	
	//Destroy when outside the view
	else if (slowdown == 2) {
	
		if ((xspeed < 0) && (camera_get_view_x(view_camera[0]) - 16))
		|| ((xspeed > 0) && (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16))
			instance_destroy();
	}
#endregion

//Set facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;