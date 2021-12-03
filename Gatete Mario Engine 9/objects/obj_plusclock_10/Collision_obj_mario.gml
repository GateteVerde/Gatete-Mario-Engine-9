/// @description Collect the clock

//Play 'Clock' sound
audio_play_sound(snd_clock, 0, false);

#region EFFECT

	//Repeat 6 times
	repeat (6) {

		with (instance_create_depth(x + 8, y + 8, -2, obj_sparkle)) {
	
			sprite_index = spr_sparkle;
			gravity = 0.2;
			shrink_rate = 0.0324;
			motion_set(random_range(80, 100), random_range(1, 3));			
		}
	}
	
	//Create score
	with (instance_create_depth(x, y + 8, -6, obj_score)) value = -4;

	//Create ring and needle
	instance_create_depth(x + 8, y + 8, -2, obj_needle);
	with (instance_create_depth(x + 8, y + 8, -2, obj_blend_ring)) {
		
		beam = true;
		image_blend = make_colour_rgb(144, 240, 248);
	}
	
#endregion

//Destroy
instance_destroy();