/// @description Count Platform logic

//Inherit the parent event
event_inherited();

#region PLAYER LOGIC

	//Check for the player
	var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

	//If the player exists and this one is above this platform
	if (ison == 0)
	&& (mario)
	&& (mario.state != playerstate.jump)
	&& (mario.bbox_bottom < yprevious+5) {
		
		//Mario is on this platform
		ison = 1;
		
		//If this platform can be step on more
		if (count > 0) {
			
			//Play 'Platform Count' sound
			audio_play_sound(snd_carrotplat, 0, false);
		
			//Decrement
			count--;
			count_last++;
		
			//Animate
			image_speed = 1;
		}
	}
	else if ((!mario) && (ready == 0)) {
	
		if (ison == 1)
			ison = 0;
	}
	
#endregion

//If falling...
if (ready == 1) {
		
	//And this platform is below the view
	if (bbox_top > (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))) {
	
		ready = 2;
		alarm[1] = 1;
	}
}
	
//Cap vertical speed
if (vspeed > 3)
	vspeed = 3;