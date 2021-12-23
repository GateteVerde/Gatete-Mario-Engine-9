/// @description Collect the coin

//Play 'Big Coin' sound
audio_play_sound(snd_coin_big, 0, false);

//Increment coins
coins_add();

//Remember that the coin has been collected
ds_map_add(global.acecoins, id, 1);

#region SCORE

	with (instance_create_depth(x, y, -6, obj_score)) {
	
		if (ds_map_size(global.acecoins) >= 5)
			value = -1;
		else
			value = power(2, ds_map_size(global.acecoins)-1)*1000;
	}
#endregion

#region EFFECT

	//Repeat 6 times
	repeat (6) {

		with (instance_create_depth(x, y + 4, -2, obj_sparkle)) {
	
			sprite_index = spr_sparkle_b;
			gravity = 0.2;
			shrink_rate = 0.0324;
			motion_set(random_range(80, 100), random_range(1, 3));			
		}
	}

	//Create ring
	with (instance_create_depth(x, y + 4, -2, obj_blend_ring)) image_blend = make_colour_rgb(248, 216, 0);
	
#endregion

//Destroy
instance_destroy();