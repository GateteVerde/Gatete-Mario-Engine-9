/// @description Break blocks if Mario is giant

//Check for Mario
var mario = collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+4, bbox_bottom, obj_mario, 0, 0);

//If Mario does exist
if (mario)
&& (global.powerup == cs_mega) {
	
	//If Mario is below the top of the pipe
	if (mario.bbox_bottom > yprevious+5) {
		
		//Play 'Break' sound
		audio_play_sound(snd_destroy, 0, false);
		
		//Shake the screen
		shake_camera(6, ceil(audio_sound_length(snd_destroy) * room_speed), true);
		
		//Check horizontal speed
		hsp = mario.xspeed;
		
		//Halve Mario's speed
		obj_mario.xspeed /= 4;
		
		//Create broken pipe
		pipe = instance_create_depth(x + sprite_width / 2, y + sprite_height / 2, depth - 1, obj_pipe_broken);
		with (pipe) {
			
			//Horizontal speed
			hspeed = other.hsp;
			
			//Palette
			palette = other.palette;
			
			//Height
			image_yscale = other.image_yscale;
		}

		//Destroy pipe
		instance_destroy();
	}
	
	//Otherwise, if Mario is at the top of the pipe
	else if ((mario.state < 2) && (mario.bbox_bottom < yprevious+5)) {
	
		//If the pipe has not been stomped on.
		if (stomped == 0) {
			
			//If the solid mask scale is greater than 1
			if (image_yscale > 0.34) {
				
				//Decrement scale
				image_yscale -= 1/3;
				
				//Change position
				y += 16;

				//Allow stomp
				alarm[0] = 16;
			
				//Mark the pipe as stomped
				stomped = true;
			}
		}
	}
}