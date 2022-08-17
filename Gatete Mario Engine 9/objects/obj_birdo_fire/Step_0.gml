/// @description Birdo fire logic

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
	
	//Play 'Bump' sound
	audio_play_sound(snd_bump, 0, false);
		
	//Create smoke effect
	instance_create_depth(x, y+8, -6, obj_smoke);
	
	//Destroy
	instance_destroy();
}

//Destroy when outside view
if (outside_view() == true)
	instance_destroy();