/// @description Break blocks if Mario is giant or bump blocks if you groundpound them

//Check for Mario
if (instance_exists(obj_mario)) {

	//Check for Mario
	if (collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+4, bbox_bottom+6, obj_mario, 0, 0))
	&& (global.powerup == cs_mega)
	&& (instance_exists(obj_megashroom_timer)) {
		
		//Play 'Destroy' sound
		audio_play_sound(snd_destroy, 0, false)
	
		//Create a spinning cannon
		with (instance_create_depth(x+8, bbox_bottom+8, -6, obj_blaster_dead)) {
			
			//Set the frame
			image_index = other.image_index;
			
			//Set the vertical scale
			image_yscale = other.image_yscale;
		
			//Set vertical speed
			vspeed = -4;
			
			//Set horizontal speed
			hspeed = obj_mario.xspeed / 2;
		}
		
		//Destroy
		instance_destroy();
	}
}