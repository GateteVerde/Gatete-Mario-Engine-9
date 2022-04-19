/// @description Dolphin logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

#region LOGIC

	//Gravity
	yadd = 0.1;

	//Check for water
	water = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_swim, 0, 0);

	//If there's water
	if (water) && (y > water.y+12) {
    
	    //Snap in water
	    y = water.y+12

	    //Stop vertical movement
	    yspeed = -5.5;
	}

	//Cap vertical speed
	if (yspeed > 3.5) {

		yspeed = 3.5;
		yadd = 0;
	}
#endregion

//Facing direction
if (xspeed > 0) {
		
	xscale = 1;
	if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 20)
		instance_destroy();
}
else if (xspeed < 0) {
	
	xscale = -1;
	if (x < camera_get_view_x(view_camera[0]) - 20)
		instance_destroy();
}
