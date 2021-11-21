/// @description Create the indicated gizmo and make the engine move if required
	
//If the gizmo chosen is the rope
if (gizmo == 0) {
	
	//If the part does not exist
	if (part == noone) {
		
		part = instance_create_depth(x, y+14, depth + 1, obj_engine_rope);
		with (part) {
		
			parent = other.id;
			image_yscale = (other.height/16) / 2;
		}
	}
			
	//Set up direction based on modifier
	if (place_meeting(x, y, obj_up)) {

		direct = 90;
		state = "IN_LINE";
	}
	else if (place_meeting(x, y, obj_down)) {

		direct = 270;
		state = "IN_LINE";
	}
	else if (place_meeting(x, y, obj_left)) {

		direct = 180;
		state = "IN_LINE";
	}
	else if (place_meeting(x, y, obj_right)) {

		direct = 0;
		state = "IN_LINE";
	}
	else
		direct = 0;
}

//Otherwise, if the gizmo chosen is the pole
else if (gizmo == 1) {
	
	//If the part does not exist
	if (part == noone) {
		
		part = instance_create_depth(x, y+14, depth + 1, obj_engine_pole);
		with (part) {
		
			parent = other.id;
			image_yscale = (other.height/16) / 2;
		}
	}

	//Set up direction based on modifier
	if (place_meeting(x, y, obj_up)) {

		direct = 90;
		state = "IN_LINE";
	}
	else if (place_meeting(x, y, obj_down)) {

		direct = 270;
		state = "IN_LINE";
	}
	else if (place_meeting(x, y, obj_left)) {

		direct = 180;
		state = "IN_LINE";
	}
	else if (place_meeting(x, y, obj_right)) {

		direct = 0;
		state = "IN_LINE";
	}
	else
		direct = 0;
}
	
//Otherwise, if the gizmo chosen is the sawblade
else if ((gizmo == 2) || (gizmo == -2)) {
	
	//Animate faster
	image_speed = 0.5;
	
	//Set alarm
	post_t = 7;
	alarm[1] = post_t;
	
	//If the part does not exist
	if (part == noone) {
	
		//Create it
		part = instance_create_depth(x, y, depth + 1, obj_engine_sawblade);
		with (part) {
		
			//If the sawblade should be upwards
			if (other.gizmo == 2)
				sprite_index = spr_engine_sawblade;
			else
				sprite_index = spr_engine_sawblade_down;
		}
	}
	
	//Spd
	spd = 1.5;
		
	//Start moving
	state = "IN_LINE";
		
	//Move towards Mario
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		direct = 180
	else
		direct = 0;
}