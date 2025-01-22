/// @description When coins falls down, destroy

if ((vspeed > 0) && (y > ystart)) {
	
	//Switch between the sprite
	switch (sprite_index) {
		
		//Anti-P Coins
		case (spr_coin_npc_antip):
			#region EFFECT

				//Repeat 6 times
				repeat (6) {

					with (instance_create_depth(x, y + 8, -2, obj_sparkle)) {
	
						sprite_index = spr_sparkle_d;
						gravity = 0.2;
						shrink_rate = 0.0324;
						motion_set(random_range(80, 100), random_range(1, 3));		
					}
				}

				//Create ring
				with (instance_create_depth(x, y + 8, -2, obj_blend_ring)) image_blend = make_colour_rgb(96, 136, 216);
	
			#endregion
			break;		
		
		//P-Coins
		case (spr_coin_npc_p):
		case (spr_coin_star_p):
		
			#region EFFECT

				//Repeat 6 times
				repeat (6) {

					with (instance_create_depth(x, y + 8, -2, obj_sparkle)) {
	
						sprite_index = spr_sparkle;
						gravity = 0.2;
						shrink_rate = 0.0324;
						motion_set(random_range(80, 100), random_range(1, 3));		
					}
				}

				//Create ring
				with (instance_create_depth(x, y + 8, -2, obj_blend_ring)) image_blend = make_colour_rgb(112, 216, 248);
	
			#endregion
			break;
				
		//Default
		default:		
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
			break;
	}
	
	//Get score
	if (sprite_index != spr_coin_ace) 
	&& (sprite_index != spr_coin_star) {
		
		with (instance_create_depth(x, y, -6, obj_score)) 
			value = 10;
	}
	
	//Destroy
	instance_destroy();	
}