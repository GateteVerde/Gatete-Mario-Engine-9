/// @description Mario Door logic

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

//Do not animate
image_speed = 0;
image_index = 0;

//If the player is not holding anything
if (holding == 0)
    sprite_index = global.walk_sprite[global.powerup];
else
    sprite_index = global.hold_sprite[global.powerup];