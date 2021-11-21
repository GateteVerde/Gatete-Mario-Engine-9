/// @description Break blocks if Mario is giant

//If the block is animating, exit
if (image_speed > 0)
exit;

//Inherit event from parent
event_inherited();

//Check for Mario
if (instance_exists(obj_mario)) {

	//If Mario is tiny or small
	if (global.powerup == cs_tiny)
	|| (global.powerup == cs_small)
		exit;
		
	//Otherwise
	else if (obj_mario.yspeed > 0)
	&& (obj_mario.jumpstyle > 0)
	&& (place_meeting(x, y - obj_mario.yspeed * 2.5, obj_mario)) {

		//Break the block
		event_user(15);
		
		//If Mario has the propeller block and the 'Down' key is not being held.
		if (global.powerup == cs_propeller) {
			
			//If the 'Down' key or the left stick is held downwards
			if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5))
				exit;
			else
				with (obj_mario) event_user(1);
		}
		else
			with (obj_mario) event_user(1);
	}
}