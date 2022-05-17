/// @description Lakitu Cloud logic

//Set depth
depth = -6;

//Check if Mario exists
if (instance_exists(obj_mario)) {
    
    //If Mario is on this cloud
    if (player_on == true) {
        
        //Force set player variables
		with (obj_mario) event_user(15);
        
        //If Mario is climbing
        if (obj_mario.state == playerstate.climb) {
        
            with (obj_mario) {
            
                oncloud = false;                
            }
            player_on = false;
            can_on = true;
        }
        
        //If 'Action 0' is pressed
        if (input_check_pressed(input.action_0)) {
        
            //If Mario can jump
            if (obj_mario.jumping == 0) {
            
                //With Mario
                with (obj_mario) {
					
					//Stop riding cloud
                    oncloud = false;
					
					//Set vertical speed
                    yspeed = -3.4675;
					y--;
					
					//Jump
                    jumping = 1;
					
					//Do spin jump if required
					if (input_check(input.up))
						jumpstyle = 1;
					else
						jumpstyle = 0;
                }
                
                //Dismount from the cloud
                player_on = false;
                
                //Allow mount
                can_on = false;
				alarm[0] = 30;
            }
        }
    }
}

//Movement
event_user(0);

//If moving right
if (hspeed > 0)
&& (collision_rectangle(bbox_right, obj_mario.bbox_top+4, bbox_right+1+hspeed, obj_mario.bbox_bottom-1, obj_solid, 1, 0)) {
			
	//Stop horizontal speed
	hspeed = 0;
				
	//Prevent getting embed on a wall
	while (collision_rectangle(bbox_right, obj_mario.bbox_top+4, bbox_right+hspeed, obj_mario.bbox_bottom-1, obj_solid, 1, 0))
		x--;  
}

//If moving right
else if (hspeed < 0)
&& (collision_rectangle(bbox_left-1+hspeed, obj_mario.bbox_top+4, bbox_left-1, obj_mario.bbox_bottom-1, obj_solid, 1, 0)) {
			
	//Stop horizontal speed
	hspeed = 0;
				
	//Prevent getting embed on a wall
	while (collision_rectangle(bbox_left+hspeed, obj_mario.bbox_top+4, bbox_left, obj_mario.bbox_bottom-1, obj_solid, 1, 0))
		x++;  
}
