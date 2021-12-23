/// @description Destroy when moving down

//If hit with a pow block, apply physics
if (ready == 1)
	event_inherited();

//Otherwise, if collected
else if (ready == 2) {

	//If moving down
	if (vspeed > 0) && (y > yy) {
	
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
	}
}