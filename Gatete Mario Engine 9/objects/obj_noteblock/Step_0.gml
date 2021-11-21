/// @description Make Mario bounce depending of it's position

//If Mario does exist
if (instance_exists(obj_mario)) {

	//If this block can make Mario bounce on all sides
	if (global.noteblock_all_sides == true) {
		
		//Make sure that Mario is overlapping the block
		if (obj_mario.bbox_top < bbox_bottom) {

			//If Mario is at the left side of the block
			if (collision_rectangle(bbox_left-2, bbox_top, bbox_left, bbox_bottom, obj_mario, 0, 0)) {
		
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
	
				//Bounce Mario to the left
				obj_mario.xspeed = -2;
		
				//Block movement
				hspeed = 2;
				ready = 1;
				alarm[0] = 4;
			}
	
			//Otherwise, if Mario is at the right side of the block
			else if (collision_rectangle(bbox_right, bbox_top, bbox_right+2, bbox_bottom, obj_mario, 0, 0)) {
			
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
	
				//Bounce Mario to the left
				obj_mario.xspeed = 2;
		
				//Block movement
				hspeed = -2;
				ready = 1;
				alarm[0] = 4;
			}
		}
	}
	
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