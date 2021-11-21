/// @description Collect the coin

//Play 'Coin' sound
audio_play_sound(snd_coin, 0, false);

//Increment coins
coins_add();

//Increment score
score += 50;

#region EFFECT

	//Repeat 6 times
	repeat (6) {

		with (instance_create_depth(x + 8, y + 8, -2, obj_sparkle)) {
	
			sprite_index = spr_sparkle_d;
			gravity = 0.2;
			shrink_rate = 0.0324;
			motion_set(random_range(80, 100), random_range(1, 3));			
		}
	}

	//Create ring
	with (instance_create_depth(x + 8, y + 8, -2, obj_blend_ring)) image_blend = make_colour_rgb(96, 136, 216);
	
#endregion

//Destroy
instance_destroy();