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
		
		//If Mario does not have the propeller powerup
		if (global.powerup != cs_propeller) {
		
			//If Mario is doing a ground pound
			if (obj_mario.groundpound == 2) {
			
				//If Mario is small
				if (global.powerup == cs_small) {
				
					//Bump block downwards
					vspeed = 2;
					alarm[0] = 4;
				}
				
				//Otherwise
				else {
					
					//Break
					event_user(15);
				
					//If the 'Down' key or the left joystick is pulled down, exit this event
					if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5))
						exit;
					
					//Otherwise
					else {
					
						with (obj_mario) {
						
							yspeed = 0;
							groundpound = 0;
						}
					}
				}
			}
			
			//Otherwise, if Mario is doing a spin jump
			else if (obj_mario.jumpstyle == 1) {
			
				//If Mario is small
				if (global.powerup > cs_small) {
				
					//Break
					event_user(15);
				
					//Make Mario bounce
					with (obj_mario) event_user(1);
				}
			}
		}
		
		//Otherwise, if Mario has the propeller powerup
		else if (global.powerup == cs_propeller) {
		
			//If Mario is doing a groundpound
			if (obj_mario.groundpound == 2) {
			
				//Break
				event_user(15);
				
				//If the 'Down' key or the left joystick is pulled down, exit this event
				if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5))
					exit;
					
				//Otherwise
				else {
					
					with (obj_mario) {
						
						yspeed = 0;
						groundpound = 0;
					}
				}
			}
			
			//Otherwise
			else if (obj_mario.jumpstyle > 0) {
			
				//If the 'Down' key or the left joystick is down, break block
				if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5))			
					event_user(15);
			}
		}
	}
}