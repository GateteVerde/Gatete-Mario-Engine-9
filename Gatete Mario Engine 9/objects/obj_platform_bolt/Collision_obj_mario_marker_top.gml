/// @description Make the platform move to the left

//If Mario is moving upwards
if (obj_mario.yspeed < 0)
&& (collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+1, obj_mario_marker_top, 0, 0)) {
	
	//Play 'Bump' sound
	audio_play_sound(snd_bump, 0, false);
	
	//With Mario
	with (obj_mario) {
	
		yspeed = 1;
		jumping = 2;
	}
	
	//If there's not a wall to the left
	if (!touchwall_l) {
	
		//Animate
		image_speed = -0.5;
	
		//Move it to the left and stop it after 1/2 seconds
		hspeed = -0.25;
		alarm[0] = 30;
	}
}