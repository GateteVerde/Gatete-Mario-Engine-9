/// @description Break blocks if Mario is giant

//Inherit event from parent
event_inherited();

//Check for Mario
if (instance_exists(obj_mario)) {

	//If Mario is tiny or small
	if (global.powerup == cs_tiny)
		exit;
		
	//Otherwise
	else if (obj_mario.yspeed > 0)
	&& (place_meeting(x, y - obj_mario.yspeed * 2.5, obj_mario)) {
		
		//If Mario has the propeller block and the 'Down' key is not being held.
		if (obj_mario.groundpound == 2)
		|| (global.powerup == cs_propeller) {
				
			//If Mario is doing a groundpound and does have any powerup, exit
			if (obj_mario.groundpound == 2)
			&& (global.powerup == cs_small) {
				
				//Bump block downwards
				vspeed = 2;
				alarm[0] = 4;
			}
				
			//Otherwise, break and end groundpound if 'Down' is not longer pressed
			else {
				
				//If the 'Down' key or the left joystick is down
				if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {
					
					event_user(15);
					obj_mario.yspeed = -0.25;
				}
					
				//Otherwise, break and end groundpound
				else {
				
					//Break
					event_user(15);
					
					//Stop mario vertical motion
					with (obj_mario) {
						
						yspeed = 0;
					    groundpound = 0;
					}
				}
			}
		}
	}
}