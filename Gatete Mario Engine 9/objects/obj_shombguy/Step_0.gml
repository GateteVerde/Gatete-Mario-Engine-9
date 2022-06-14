/// @description Shomb-Guy logic

//Inherit the parent event
event_inherited();

#region MANAGE TIMER

	//Decrement timer
	if (freeze == false) {

		if (aa > 0) { //If the timer is still going...

		    aa--;
		    if (aa < 120) {
    
		        //Set the flashing sprite
		        sprite_index = spr_shombguy_th;
        
		        //Make sure to stop horizontal speed if on ground
		        if (yadd == 0) {
        
		            //If moving
		            if (xspeed != 0)
		                xspeed = 0;
		        }
		    }
		}

		//Otherwise, explode.
		else {

		    instance_create_layer(x, y, "Main", obj_explosion_lite);
		    instance_destroy();
		    exit;
		}
	}
#endregion

//Face towards direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;