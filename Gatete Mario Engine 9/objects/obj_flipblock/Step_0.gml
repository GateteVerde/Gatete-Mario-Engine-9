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
		exit;
		
	//If Mario is above this block
	if (place_meeting(x, y - obj_mario.yspeed * 2.5, obj_mario)) {
		
		//If Mario is doing a spin jump or drilling while in the propeller suit
		if (obj_mario.groundpound == 0)
		&& (obj_mario.yspeed > 0)
		&& (obj_mario.jumpstyle > 0) {

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
	
		//Otherwise, if Mario is doing a groundpound
		else if (obj_mario.groundpound == 2) 
		&& (obj_mario.yspeed > 0) {
	
			//If the 'Down' key or the left joystick is down
			if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {
				
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
				
				//Destroy the block below
				vspeed = 2;
				alarm[0] = 4;
		
				//Make Mario do a mini jump
				obj_mario.yspeed = 0;
			}
					
			//Otherwise, break and end groundpound
			else {
				
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
				
				//Move the block
				vspeed = 2;
				alarm[0] = 4;
				
				//Force end ground pound
				obj_mario.groundpound = 0;
					
				//Stop Mario's vertical speed
				if (obj_mario.yspeed > 0)
					obj_mario.yspeed = 0;
			}		
		}
	}
}