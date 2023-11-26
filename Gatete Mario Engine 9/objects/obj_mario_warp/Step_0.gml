/// @description Mario Pipe Logic

//Animate cape if it is visible
cape_anim += 0.065+abs(hspeed)/7.5;

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

//If the player can exit the pipe
if (ready == 1) {

    //If there's not a solid overlapping
    if (!collision_point(x-8, bbox_top, obj_solid, 0, 0))
    && (!collision_point(x+7, bbox_top, obj_solid, 0, 0))
    && (!collision_point(x-8, bbox_bottom, obj_solid, 0, 0))
    && (!collision_point(x+7, bbox_bottom, obj_solid, 0, 0)) {
    
        //Create a new player object...
        with (instance_create_depth(x, y, -5, obj_mario)) {

			//Hereby facing direction and flashing
            xscale = other.image_xscale;
            isflashing = other.isflashing;
			
			//If moving down, set 'Jump' state
			if (other.vspeed > 0)
				state = playerstate.jump;
        }
        
        //...and destroy this object
        instance_destroy();
    }
}

//If the player can move
if ((canmove == 1) && (cannon < 2)) {
	
	//If there's solid on all four sides
	if (collision_point(x-8, bbox_top, obj_solid, 0, 0))
	&& (collision_point(x+7, bbox_top, obj_solid, 0, 0))
	&& (collision_point(x-8, bbox_bottom, obj_solid, 0, 0))
	&& (collision_point(x+7, bbox_bottom, obj_solid, 0, 0)) {
		
		speed = 3;
		if (visible)
			visible = false;
	}
		
	//Otherwise
	else {
		
		#region PLAY SOUND
		
			//If Mario is about to exit this pipe 
			if (ready2 == 1) {
		
				//Play 'Warp' sound
				audio_play_sound(snd_warp, 0, false);
			
				//Allow exit
				ready2 = 2;
			}		
		#endregion
    
	    //Set speed
	    if ((direction == 90) || (direction == 270)) {
		
			//If Mario is in cannon mode and moving up
			if ((cannon >= 1) && (vspeed < 0))
				speed = 4;
			else {
				
				speed = 1;
				if (!visible)	
					visible = true;
			}
		}
	    else {
			
			speed = 0.5;
			if (!visible)
				visible = true;
		}
	}
}

//Set facing direction
if (hspeed > 0)
    image_xscale = 1;
else if (hspeed < 0)
    image_xscale = -1;