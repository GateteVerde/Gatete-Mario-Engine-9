/// @description Collect the coin

//If not moving up
if (yspeed < 0)
exit;

//Play 'Coin' sound
audio_play_sound(snd_coin, 0, false);

//Increment coins
coins_add();

#region SCORE

	//Set the amount of score this coin will give...
	var amount = (enemy) ? 200 : 10;
	
	//...and then generate the effect
	with (instance_create_depth(x, y, -4, obj_score))
		value = amount;
#endregion

#region EFFECT

	//Repeat 6 times
	repeat (6) {

		with (instance_create_depth(x, y + 8, -2, obj_sparkle)) {
	
			sprite_index = spr_sparkle_b;
			gravity = 0.2;
			shrink_rate = 0.0324;
			motion_set(random_range(80, 100), random_range(1, 3));			
		}
	}

	//Create ring
	with (instance_create_depth(x, y + 8, -2, obj_blend_ring)) image_blend = make_colour_rgb(248, 216, 0);
	
#endregion

//Destroy
instance_destroy();