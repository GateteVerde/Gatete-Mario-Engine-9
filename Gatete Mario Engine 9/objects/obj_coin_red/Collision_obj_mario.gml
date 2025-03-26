/// @description Collect the coin if visible

//If the coin is visible
if (visible) {

	//Play 'Redcoin 8' sound
	if (instance_number(obj_coin_red) == 1)		
		audio_play_sound(snd_redcoin8, 0, false);
		
	//Otherwise
	else {
		
		//Find the red coin sound, and then play it.
		var _snd = asset_get_index("snd_redcoin" + string(global.coins_red + 1));
		audio_play_sound(_snd, 0, false);
	}
	
	//Add coins
	coins_add();
	
	//Get score
	score += 50; 
	
	#region EFFECT

		//Repeat 6 times
		repeat (6) {

			with (instance_create_depth(x + 8, y + 8, -2, obj_sparkle)) {
	
				sprite_index = spr_sparkle_c;
				gravity = 0.2;
				shrink_rate = 0.0324;
				motion_set(random_range(80, 100), random_range(1, 3));			
			}
		}

		//Create ring
		with (instance_create_depth(x + 8, y + 8, -2, obj_blend_ring)) image_blend = make_colour_rgb(248, 144, 32);
	
	#endregion

    //Increment coins
    global.coins_red++;
    with (instance_create_depth(x+8, y+8, -6, obj_score_coins)) {
    
        amount = global.coins_red;
        if (instance_number(obj_coin_red) == 1)		
			ready2 = 1;
    }
    
    //Destroy
    instance_destroy();
}