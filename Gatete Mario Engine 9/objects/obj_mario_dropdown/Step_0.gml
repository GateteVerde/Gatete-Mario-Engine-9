/// @description Mario's dropdown logic

//If gravity is enabled
if (enable_gravity == 1) {
	
	// Update position based on xspeed and yspeed values
	x += xspeed;
	y += yspeed;
	xspeed += xadd;
	yspeed += yadd;	
}

//Manage collision
event_user(0);

//If the player does exist.
if (instance_exists(obj_mario)) {

    //If the player does have the cat suit
    if (global.powerup == cs_bell) {
    
        //Force end drop-down if the 'Down' key is not longer pressed.
        if (ready == 1) 
		&& (!input_check(input.down)) 
		&& (!gamepad_axis_value(0, gp_axislv) < 0.5) {
            
            //Hereby both hspeed and vspeed
            with (obj_mario) {
            
                xspeed = other.xspeed;
                yspeed = other.yspeed;
            }
        
            //Destroy
            instance_destroy();            
        }
        
        else {
    
            //Snap the player onto this object
            obj_mario.x = x;
            obj_mario.y = y;
                
            //Stop the player
			with (obj_mario) {
				
				xspeed = 0;
				yspeed = 0;
				disablegrav = 1;
			}
			
			//Change scale
			xscale = obj_mario.xscale;
			
			//Change flashing
			isflashing = obj_mario.isflashing;
        }
    }
    else {
    
        //Hereby both hspeed and vspeed
        with (obj_mario) {
        
            xspeed = other.xspeed;
            yspeed = other.yspeed;
        }
    
        //Destroy
        instance_destroy();
    }
}
else
    instance_destroy();