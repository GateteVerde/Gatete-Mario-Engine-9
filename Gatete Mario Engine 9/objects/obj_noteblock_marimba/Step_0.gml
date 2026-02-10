/// @description Make Mario bounce depending of it's position

//If Mario does exist
if (instance_exists(obj_mario)) {

	//If Mario is above this block
	if (obj_mario.yspeed == 0)
	&& (collision_rectangle(bbox_left, bbox_top-3, bbox_right, bbox_top, obj_mario, 0, 0)) {
	
		//Make Mario Jump when the 'Jump' key is pressed
		if (input_check_pressed(input.action_0)) {
			
			//Play 'Trampoline' sound
			audio_play_sound(snd_trampoline, 0, false);
		
			//Make Mario jump
			with (obj_mario) {
			
				event_user(1);
				state = playerstate.jump;
			}		
		}
	}
}