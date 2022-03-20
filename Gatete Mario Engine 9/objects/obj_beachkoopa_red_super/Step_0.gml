/// @description Red Super Koopa logic

//If not frozen
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region MOVEMENT

	//Cap vertical speed
	if (yspeed > 2)
		yspeed = 2;
	else if (yspeed < -1) {
		
		yspeed = -1;
		if (y < camera_get_view_y(view_camera[0]) - 32)
			instance_destroy();
	}
	
	//If moving up
	if (flyingup)		
		yspeed -= 0.0375;
#endregion

//Set facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;

//If the Silver P-Switch is active and the enemy is inside the view and can turn into a silver coin
if (obj_levelcontrol.gswitch_on == true) 
&& (turn_silver == true)
&& (outside_view() == false)
	exit;