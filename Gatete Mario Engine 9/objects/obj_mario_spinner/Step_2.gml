/// @description Manage Spinner

#region ADHERING TO PLAYER

	//If the player is alive
	if (instance_exists(owner)) {

		//Move towards the player
		x = owner.x;
		y = owner.y;
		
		//If this powerup is not the ranger one
		if (global.powerup != cs_ranger) {
		
			//Obtain horizontal motion
			if (owner.xspeed != 0)
				xspeed = owner.xspeed;
			else
				xspeed = 1 * sign(owner.xscale);
		}
	}
	
	//Destroy if Mario is transforming
	if (instance_exists(obj_mario_transform))
		instance_destroy();
	
#endregion