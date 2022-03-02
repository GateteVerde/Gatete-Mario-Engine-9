/// @description Wake up

//If there's gravity
if (yadd > 0) {

    alarm[1] = 1;
    exit;
}

//Otherwise
else {

	//Check sprite
	switch (sprite_index) {

	    //Goombud
	    case (spr_goombud_down): {
        
	        with (instance_create_depth(x, y, -2, obj_goombud)) {
				
				//Set the vertical speed
				yspeed = -3;
				y--;
        
	            //Set the horizontal speed
				if (!instance_exists(obj_mario))
				|| (obj_mario.x < x)
					xspeed = -0.5;
				else
					xspeed = 0.5;
	        }            
	    } break;
		
	    //Red Galoomba
	    case (spr_galoomba_red_down): {
        
	        with (instance_create_depth(x, y, -2, obj_galoomba_red)) {
        
	            //Set the sprite
				sprite_index = spr_galoomba_red;
				
				//Charge at Mario
				charge = 1;
				
				//Set the vertical speed
				yspeed = -3;
				y--;
	        }            
	    } break;
    
	    //Default sprite
	    default: {
        
	        with (instance_create_depth(x, y, -2, obj_galoomba)) {
				
				//Set the vertical speed
				yspeed = -3;
				y--;
        
	            //Set the horizontal speed
				if (!instance_exists(obj_mario))
				|| (obj_mario.x < x)
					xspeed = -0.5;
				else
					xspeed = 0.5;
	        }
	    } break;
	}

	//Destroy
	instance_destroy();
}