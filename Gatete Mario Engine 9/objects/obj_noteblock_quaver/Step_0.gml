/// @description Make Mario bounce depending of it's position

//If Mario does exist
if (instance_exists(obj_mario)) {
	
	//If Mario is above this block
	if (obj_mario.yspeed == 0)
	&& (collision_rectangle(bbox_left, bbox_top-3, bbox_right, bbox_top, obj_mario, 0, 0)) {
		
		//Sprout out an item if there's any
		if (sprout > cs_coin) {
			
			event_user(1);
		}
		
		//Move block
		ready = 1;
		vspeed = 2;
		alarm[0] = 4;
		
		//Make Mario jump
		with (obj_mario) {
			
			event_user(1);
			state = playerstate.jump;
		}
	
		//Check if the 'Jump' key is pressed
		if (input_check(input.action_0))
			audio_play_sound(snd_trampoline, 0, false);
		else
			audio_play_sound(snd_bump, 0, false);
	}
}