/// @description Collect the coin

//If not moving up
if (yspeed < 0)
exit;

//Play 'Coin' sound
audio_play_sound(snd_coin, 0, false);

//Increment coins
coins_add();

#region EFFECT

	//Repeat 6 times
	repeat (6) {

		with (instance_create_depth(x, y + 8, -2, obj_sparkle)) {
	
			sprite_index = spr_sparkle_f;
			gravity = 0.2;
			shrink_rate = 0.0324;
			motion_set(random_range(80, 100), random_range(1, 3));			
		}
	}

	//Create ring
	with (instance_create_depth(x, y + 8, -2, obj_blend_ring)) image_blend = make_colour_rgb(208, 208, 208);
	
#endregion

#region SCORE

	//Create score
	with (instance_create_depth(x, y, -4, obj_score)) {

		switch (global.coins_silver) {
	
			case (0): value = 400; break;
			case (1): value = 800; break;
			case (2): value = 1000; break;
			case (3): value = 2000; break;
			case (4): value = 4000; break;
			case (5): value = 8000; break;
			case (6): value = -1; break;
			case (7): value = -2; break;
			default: value = -3; break;
		}
	}
	
	//Increment coin collection
	global.coins_silver++;
#endregion

//Destroy
instance_destroy();
