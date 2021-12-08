/// @description Freeze all objects and begin animation

//Freeze player
freeze_create();

//Activate Mario, make him invisible and disable it's gravity
instance_activate_object(obj_mario);
with (obj_mario) {
	
	visible = 0;
	enable_gravity = 0;
}

//Activate array objects
freeze_activate();

#region SET SEQUENCE

	//Set the animation sequence.
	switch (sequence) {
	
		//Big to Tiny
		case (-3): sprite_index = spr_mario_shrink_big_to_tiny; break;
	
		//Small to Tiny
		case (-2): sprite_index = spr_mario_shrink_small_to_tiny; break;
	
		//Tiny to Big
		case (-1): sprite_index = spr_mario_grow_tiny_to_big; break;

	    //Small to Big
	    case (0): sprite_index = spr_mario_grow; break;
    
	    //Big to Small
	    case (1): sprite_index = spr_mario_shrink; break;
    
	    //Power up
	    case (2): {
    
	        sprite_index = spr_mario_powerup;
	        loop = 3;
	    } 
		break;
    
	    //Power down
	    case (3): {
    
	        sprite_index = spr_mario_powerdown;
	        loop = 6;
	    } 
		break;
    
	    //Transform
	    case (4): sprite_index = spr_mario_transform; break;
	
		//Mega Grow
		case (5): {
		
			//Set sprite
			sprite_index = spr_mario_grow_to_mega;
			
			//Turn Mario invisible
			obj_mario.visible = false;
		
			//Set special state
			ready = 2;
		
			//Do not animate
			image_speed = 0;
			image_index = 0;
		
			//Turn visible
			visible = true;
		
			//Exit
			exit;
		}
	
		//Mega Shrink
		case (6): {
		
			//Turn Mario invisible
			obj_mario.visible = false;
		
			//Set special state
			ready = 2;
		
			//Set frame
			image_speed = 0;
			image_index = obj_mario.image_index;
		
			//Turn visible
			visible = true;
		
			//Exit
			exit;
		}
	}

#endregion

//Animation has been set.
ready = 1;
visible = 1;