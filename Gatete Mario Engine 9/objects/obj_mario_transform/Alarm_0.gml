/// @description Freeze all objects and begin animation

//Freeze all objects under obj_physicsparent
with (obj_physicsparent) event_user(13);
with (obj_platformparent) event_user(13);

//Freeze skewers
with (obj_skewer_trunk) event_user(13);

//Freeze Mario
with (obj_mario) {

	if (freeze == false)
		event_user(13);
}

#region SET SEQUENCE

	image_speed = 1.3;
	
	//Set the animation sequence.
	switch (sequence) {
		
		//Big to Tiny
		case (-3): sprite_index = global.tf_shrink_sprite_b; break;
	
		//Small to Tiny
		case (-2): sprite_index = global.tf_shrink_sprite_c; break;
	
		//Tiny to Big
		case (-1): sprite_index = global.tf_grow_sprite_c; break;

	    //Small to Big
	    case (0): sprite_index = global.tf_grow_sprite_a; break;
    
	    //Big to Small
	    case (1): sprite_index = global.tf_shrink_sprite_a; break;
    
	    //Power up
	    case (2): {
    
			//If Mario is driving a shmup
			if (instance_exists(obj_mario_shmup)) {
				
				//Set sprite
				sprite_index = (obj_mario_shmup.subpop == 1) ? global.tf_grow_sprite_subp : global.tf_grow_sprite_skyp;
				
				//Set loops
				loop = 8;
			}
			
			//Otherwise
			else {
				
				sprite_index = global.tf_powerup;
				loop = 3;
			}
	    } 
		break;
    
	    //Power down
	    case (3): {
    
			//If Mario is driving a shmup
			if (instance_exists(obj_mario_shmup)) {
				
				//Set sprite
				sprite_index = (obj_mario_shmup.subpop == 1) ? global.tf_shrink_sprite_subp : global.tf_shrink_sprite_skyp;
				
				//Set loops
				loop = 8;
			}
			
			//Otherwise
			else {
				
				sprite_index = global.tf_powerdown;
				loop = 6;
			}
	    } 
		break;
    
	    //Transform
	    case (4): sprite_index = spr_player_global_transform; break;
	
		//Mega Grow
		case (5): {
		
			//Set sprite
			sprite_index = global.tf_grow_sprite_b;
			
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
			with (obj_mario) visible = false;
		
			//Set special state
			ready = 2;
		
			//Set frame
			image_speed = 0;
			
			//Set frame based on active object
			if (instance_exists(obj_mario))
				image_index = obj_mario.image_index;
			else {
			
				sprite_index = global.goal_sprite[cs_big];
				image_index = 0;
			}
		
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