/// @description Generate effect

//Check if there's a water surface below
if (position_meeting(x, bbox_bottom + 1, obj_swim)) {
	
	with (instance_create_depth(x+random(sprite_width), bbox_bottom - 12, -4, obj_smoke)) {
		
		sprite_index = spr_smoke_c;
		gravity = 0.15;
		hspeed = random_range(-1, 1);
		vspeed = random_range(-2, -1);
	}
}

//Repeat the process
alarm[0] = 1;