/// @description Exit from the pipe

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

//If the player can exit the pipe
if (ready == 1) {

    //If there's not a solid overlapping
    if (!collision_point(x-8, bbox_top, obj_solid, 0, 0))
    && (!collision_point(x+7, bbox_top, obj_solid, 0, 0))
    && (!collision_point(x-8, bbox_bottom, obj_solid, 0, 0))
    && (!collision_point(x+7, bbox_bottom, obj_solid, 0, 0)) {
    
        //Create a new player object...
        with (instance_create_depth(x, y, -5, obj_mario)) {

            xscale = other.image_xscale;
			state = playerstate.jump;
            isflashing = other.isflashing;
        }
        
        //...and destroy this object
        instance_destroy();
    }
}

//If the player can move
if ((canmove == 1) && (cannon < 2)) {
    
    //Set speed
    if ((direction == 90) || (direction == 270)) {
		
		//If Mario is in cannon mode and moving up
		if ((cannon == 1) && (vspeed < 0))
			speed = 4;
		else
			speed = 1;
	}
    else
        speed = 0.5;
}

//Set facing direction
if (hspeed > 0)
    image_xscale = 1;
else if (hspeed < 0)
    image_xscale = -1;