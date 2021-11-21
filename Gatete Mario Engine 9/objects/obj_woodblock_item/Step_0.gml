/// @description Make Mario bounce depending of it's position

//Inherit event from parent
event_perform_object(obj_woodblock, ev_step, ev_step_normal);

//If Mario does exist
if (instance_exists(obj_mario)) {
		
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

//Set different frame depending if it has been bumped
if (speed > 0)
	image_index = 0;
else
	image_index = 0;