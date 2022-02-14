/// @description When coins falls down, destroy

if (vspeed == 0) {
	
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
	
	//Get score
	with (instance_create_depth(x, y, -6, obj_score)) value = 10;
	
	//Destroy
	instance_destroy();	
}