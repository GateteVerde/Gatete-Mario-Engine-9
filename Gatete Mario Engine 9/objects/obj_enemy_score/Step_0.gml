/// @description Destroy when falling down

if ((vspeed > 0) && (y > ystart-16)) {

    //Play 'Coin' sound
    audio_play_sound(snd_coin, 0, false);
    
    //Create a sparkle
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

    //Get some points
    with (instance_create_depth(x, ystart, -4, obj_score)) {
    
        switch (other.handicap) {
        
            case (1): value = 100; break; //100
            case (2): value = 400; break; //400
            case (3): value = 1000; break; //1000
            case (4): value = 4000; break; //4000
            default: value = -1; break; //1-UP
        }
    }
    
    //Destroy
    instance_destroy();
}
