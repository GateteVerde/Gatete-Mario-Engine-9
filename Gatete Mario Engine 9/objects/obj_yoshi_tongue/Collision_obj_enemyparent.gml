/// @description Eat enemies

if (hunger == 0) && (ready == 0) {
    
    //If the tongue does not phase through
    if (other.edible == 2) {
        
        //Move tongue back
        ready = 1;
        alarm[0] = 8;
    }
	
	//Otherwise, if the enemy can be spitten later
	else if (other.edible == 1) {
		
		with (other) {
			
			//Flip it
			event_user(4);
			
			//Deny movement
			imheld.xspeed = 0;
			imheld.yspeed = 0;
			
			//Put enemy on tongue
			x = round(other.bbox_left + other.bbox_right) / 2 - 8;
			y = round(other.bbox_top + other.bbox_bottom) / 2 - 8;
		}
	}
	
	//Otherwise
	else if (other.edible == 0) {

	    //Enemy eaten
	    hunger = 1;
        
	    //Move tongue back
	    ready = 1;
	    alarm[0] = 8;
		
		#region Check sprite or Yoshi colour
		
			//If this is a kamikaze shell
			if (other.sprite_index == spr_shell_spin) {
			
				obj_yoshi.mouthholder = obj_shell_kicked;
				obj_yoshi.mouthsprite = spr_shell_spin;
			}
			
			//Teal
			else if (obj_yoshi.colour == 4)
				obj_yoshi.mouthholder = obj_yoshi_ice;
				
			//Pink
			else if (obj_yoshi.colour == 5)
				obj_yoshi.mouthholder = obj_turnip;

		#endregion
        
	    //Food sprite
	    foodsprite = other.sprite_index;
        
	    //Food image
	    foodindex = other.image_index;
        
	    //Food offset
	    with (other) other.foodoffset = (bbox_left+bbox_right)/2-x;
        
	    //Destroy food
	    with (other) instance_destroy();
	}
}