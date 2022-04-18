/// @description Urchin logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Stop moving when entering in contact with end markers, semisolids or solid objects
if (yspeed > 0) && (place_meeting(x, y, obj_semisolid))
|| (place_meeting(x, y, obj_solid))
|| (place_meeting(x, y, obj_endmarker)) {

	//Stop movement
	xspeed = 0;
	yspeed = 0;
	
	//Snap into grid
	move_snap(16, 16);
	
	//Start moving again
	alarm[10] = 60;
}
