/// @description Move towards Mario

#region RESUME

	if (state == 1) {
		
		//Change state
		state = 2;

		//Set hor. speed
		xspeed = 1 * sign(xscale);

		//Resume animation
		image_speed = 1;
		for (i=1; i < seg; i++) 
		    mybody[i].image_speed = 1;
	}
#endregion

//If Mario does exist
if (instance_exists(obj_mario)) {

    //If Mario is at the left and the Wiggler is moving right
    if ((obj_mario.x < x) && (xspeed > 0))  {
    
        xspeed = -1;
        alarm[0] = 40;
    }
    
    //Otherwise, if Mario is at the right and the Wiggler is moving left
    else if ((obj_mario.x > x) && (xspeed < 0)) {
    
        xspeed = 1;
        alarm[0] = 40;
    }
    
    //Otherwise, repeat
    else
        alarm[0] = 40;
}
else	
	alarm[0] = 1;


