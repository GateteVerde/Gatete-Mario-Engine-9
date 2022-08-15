/// @description Birdo egg logic

//Manage pseudo movement variables
if (freeze == false) {

	//Handle horizontal motion
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Set facing direction
xscale = 1;

//Wall collision
if ((xspeed < 0) && (collision_rectangle(bbox_left-xspeed, bbox_top, bbox_left, bbox_bottom, obj_solid, 0, 0)) || (collision_rectangle(bbox_left-xspeed, bbox_top, bbox_left, bbox_bottom, obj_slopeparent, 1, 0)))
|| ((xspeed > 0) && (collision_rectangle(bbox_right, bbox_top, bbox_right+xspeed, bbox_bottom, obj_solid, 0, 0)) || (collision_rectangle(bbox_right, bbox_top, bbox_right+xspeed, bbox_bottom, obj_slopeparent, 1, 0))) {

	//If not bumped
	if (ready == 0) {
	
		//Play 'Bump' sound
		audio_play_sound(snd_bump, 0, false);
		
		//Flag as bumped
		ready = 1;
		
		//Reverse horizontal speed
		xspeed = -xspeed/4;
		
		//Apply gravity
		yadd = 0.1;
	}
}

//Destroy when outside view
if (outside_view() == true)
	instance_destroy();