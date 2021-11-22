/// @description Get 3 extra lives

#region EFFECT

	//Repeat 16 times
	repeat (16) {
	
		with (instance_create_depth(x, y+8, -2, obj_sparkle)) {
	
			sprite_index = spr_sparkle_b;
			motion_set(random(360), random(1.5));
		}
	}

	//Create effect
	with (instance_create_depth(x, y+8, -6, obj_blend_ring)) {
	
		beam = true;
		image_blend = make_colour_rgb(248, 216, 0);
	}
#endregion

//Add to map
ds_map_add(global.moons, id, 1);

//Get 3 extra lives
with (instance_create_depth(x, y, -6, obj_score)) value = -3;

//Destroy
instance_destroy();