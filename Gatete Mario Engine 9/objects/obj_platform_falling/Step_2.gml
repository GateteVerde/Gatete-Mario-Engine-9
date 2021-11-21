/// @description Platform logic

//Inherit the parent event
event_inherited();

//Make the platform fall if Mario steps on it
if (ready == 0) {

	//Check for the player
	var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

	//If the player exists
	if (mario)
	&& (mario.state != playerstate.jump)
	&& (mario.bbox_bottom < yprevious+5) {
	
		//Make the platform fall
		ready = 1;
		
		//Set vertical speed
		vspeed = 0.5;
		alarm[0] = 15;
	}
}

//Otherwise, if the platform is falling
else if (ready == 1) {

	//Destroy if below the view
	if (bbox_top > (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))) {
	
		ready = 2;
		alarm[1] = 1;
	}
	
	//Cap vertical speed
	if (vspeed > 3)
		vspeed = 3;
}