/// @description Create sparkle effects

//Repeat the process
alarm[1] = 2;

//If scaled up
if ((scale == 1) && (alpha > 1)) {

	//If the object is 32 pixels below the camera top boundary
	if (y < camera_get_view_y(view_camera[0]) + 32) {

		with (instance_create_depth(x - 9 + random(18), camera_get_view_y(view_camera[0]) + 32 + random(13), -7, obj_sparkle)) {

			sprite_index = spr_sparkle_b;
			shrink_rate = 0.05;	
		}
	}

	//Otherwise
	else {

		with (instance_create_depth(x - 9 + random(18), y + random(13), -7, obj_sparkle)) {

			sprite_index = spr_sparkle_b;
			shrink_rate = 0.05;	
		}
	}
} 