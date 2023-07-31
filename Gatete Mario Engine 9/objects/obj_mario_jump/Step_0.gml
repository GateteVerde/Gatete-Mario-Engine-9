/// @description Mario Jump logic

#region UPDATE PALETTE
	
	//If Mario is invincible
	if (instance_exists(obj_invincibility)) {
    
		//If the starman is about to end
		if (obj_invincibility.alarm[0] < 120) {

			//Set up palette
			isflashing += 0.01;
			if (isflashing > 6.99)
				isflashing = 1;
		}
			
		//Otherwise
		else {
	
			//Set up palette
			isflashing += 0.05;
			if (isflashing > 6.99)
				isflashing = 1;
		}
	}
	else
	    isflashing = 0;
#endregion

//If the player jumps up to the target height
if (y < ystart) {

    //Create Mario
    with (instance_create_depth(x, y, -5, obj_mario)) {
    
        //Set vertical speed
        yspeed = -6;
        
        //Force 'Jump' state
        state = playerstate.jump;
    }

    //Destroy
    instance_destroy();
}

//Do not animate
image_speed = 0;
image_index = (holding) ? 1 : 0;

//If the player is not holding anything
if (holding == 0)
    sprite_index = global.jump_sprite[global.powerup];
else
    sprite_index = global.hold_sprite[global.powerup];