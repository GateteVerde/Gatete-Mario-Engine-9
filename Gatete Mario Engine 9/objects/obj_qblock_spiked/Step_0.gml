/// @description Bump this block 

//Check for Mario
var player = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_mario, 0, 0);

//If Mario is in position and the angle of this block is 0, bump it
if (angle == 0) {
	
	if (player)
	&& (player.yspeed <= 0) 
	&& (player.state = playerstate.jump) {

	    //Create a new block, give it the same item and bump it.
	    with (instance_create_depth(x, y, 9, obj_qblock)) {
    
	        //Set the sprite
	        sprite_index = other.sprite_index
			
			//Set the item to reveal
			sprout = other.sprout;
	
			//Set state to bumped
			ready = 1;
						
			//Set horizontal speed
			vspeed = -2;
			alarm[0] = 4;
						
			//Create block specific events
			event_user(0);	
	    }
    
	    //Destroy
	    instance_destroy();
	}
}

//Hurt the player
if ((angle == 0) && ((collision_rectangle(bbox_left,  bbox_top-1,  bbox_right,  bbox_top-1,  obj_mario,  0,  0)) && (global.mount == 0)))
|| ((angle > 30 && angle < 150) && (collision_rectangle(bbox_right+1, bbox_top, bbox_right+1, bbox_bottom, obj_mario, 0, 0)))
|| ((angle == 180) && (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_mario, 0, 0)))
|| ((angle > 210 && angle < 330) && (collision_rectangle(bbox_left-1, bbox_top, bbox_left-1, bbox_bottom, obj_mario, 0, 0)))
    with (obj_mario) event_user(0);