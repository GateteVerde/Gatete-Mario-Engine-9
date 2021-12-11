/// @description Propeller Block logic

//Inherit the parent event
event_inherited();

//If Mario is holding this item
if (held == true) {

	//If Mario is jumping and not swimming
	if (obj_mario.swimming == 0)
	&& (obj_mario.state == playerstate.jump) {
	
		//Set Mario's vertical speed
		obj_mario.yspeed -= obj_mario.yadd / 1.75;
		
		//If Mario is moving vertically
		if (obj_mario.yspeed != 0) {
			
			//If Mario is moving up
			if (obj_mario.yspeed < 0)
				image_speed = 2;
				
			//Otherwise
			else if (obj_mario.yspeed > 0) {
		
				//If the 'Action 0' key is held
				if (input_check(input.action_0)) {
			
					image_speed = 2;
					if (obj_mario.yspeed > 0.5)
						obj_mario.yspeed = 0.5;
				}
				else
					image_speed = 1;
			}
		}
		else
			image_speed = 1;
	}
}
else
	image_speed = 1;