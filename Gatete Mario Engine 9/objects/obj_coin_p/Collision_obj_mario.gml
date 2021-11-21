/// @description Collect the coin if it is visible

//If this instance is visible
if (visible == true) {

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
	
				sprite_index = spr_sparkle;
				gravity = 0.2;
				shrink_rate = 0.0324;
				motion_set(random_range(80, 100), random_range(0.5, 3));		
			}
		}

		//Create ring
		with (instance_create_depth(x + 8, y + 8, -2, obj_blend_ring)) image_blend = make_colour_rgb(112, 216, 248);
	
	#endregion

	//Destroy
	instance_destroy();
}