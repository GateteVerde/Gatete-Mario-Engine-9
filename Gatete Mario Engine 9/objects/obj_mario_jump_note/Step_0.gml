/// @description Mario Jump logic

#region UPDATE PALETTE
	
	//If Mario is invincible
	if (instance_exists(obj_invincibility)) {
    
		//If the starman is about to end
		if (obj_invincibility.alarm[0] < 120) {

			//Set up palette
			isflashing += 0.05;
			if (isflashing > 3.99)
				isflashing = 0;
		}
			
		//Otherwise
		else {
	
			//Set up palette
			isflashing += 0.25;
			if (isflashing > 3.99)
				isflashing = 0;
		}
	}
	else
	    isflashing = 0;
#endregion

//If the player jumps up to the target height
if (y < camera_get_view_y(view_camera[0]) - 48) {

	//Set exit type
	global.postchange = 2;

	//Set warp id
	global.exit_id = exit_id;

	//Go to the destination room
	if (instance_number(obj_fade_in) == 0) {
	
		with (instance_create_depth(0, 0, -100, obj_fade_in))
			target = other.destination;
	}
}

//Do not animate
image_speed = 0;
image_index = (holding) ? 1 : 0;

//If the player is not holding anything
if (holding == 0)
    sprite_index = global.jump_sprite[global.powerup];
else
    sprite_index = global.hold_sprite[global.powerup];