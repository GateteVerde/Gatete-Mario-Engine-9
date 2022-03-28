/// @description Confused Chuck logic

//Inherit the parent event
event_inherited();

#region LOGIC

	//If jumping
    if (jumping > 0) {
    
        //If moving up
        if ((jumping == 1) && (yspeed > 0)) {
        
            //Throw a ball on the same direction
            with (instance_create_depth(x+8*sign(xscale), y, -4, obj_baseball)) hspeed = 1.5*sign(other.xscale);
            
            //Set the default pose
            image_speed = 0;
            image_index = 0;
            
            //End throwing
            jumping = 2;
        }
        
        //If on ground
        else if ((jumping == 2) && (yadd == 0)) {
        
            //Set the default sprite
            sprite_index = spr_confusedchuck;
        
            //Set the default pose
            image_speed = 0;
            image_index = 0;
            
            //End throwing
            jumping = 0;
            
            //Decrement balls
            balls--;
                    
            //If there's balls left
            if (balls > 0)
                alarm[0] = 15;
            else {

                balls = choose(2, 3, 4, 5);
                alarm[0] = 60;
            }
        }
    }
#endregion

//If not throwing
if (throwing == 0) {

	//If Mario does not exist or it's at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
	    xscale = -1;
	else
	    xscale = 1; 
}