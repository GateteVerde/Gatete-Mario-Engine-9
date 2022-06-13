/// @description Break jar if Mario is giant

//Set depth
depth = -1;

//Check for Mario
var mario = collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+4, bbox_bottom, obj_mario, 0, 0);

//If Mario does exist
if (mario)
&& (global.powerup == cs_mega) {
		
	//Play 'Break' sound
	audio_play_sound(snd_break, 0, false);
		
	//Shake the screen
	shake_camera(6, ceil(audio_sound_length(snd_destroy) * room_speed), true);
		
	//Check horizontal speed
	hsp = mario.xspeed;
		
	//Halve Mario's speed
	obj_mario.xspeed /= 4;
		
	//Create broken jar
	pipe = instance_create_depth(x + sprite_width / 2, y + sprite_height / 2, depth - 1, obj_pipe_broken);
	with (pipe) {
		
		//Sprite
		sprite_index = spr_jar_broken;
			
		//Horizontal speed
		hspeed = other.hsp;
			
		//Width / Height
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
			
		//Angle
		image_angle = other.image_angle;
	}

	//Destroy pipe
	instance_destroy();
}