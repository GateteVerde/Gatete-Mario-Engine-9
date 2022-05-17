/// @description Lakitu Cloud logic

#region JUMPING INTO CLOUD

	//If Mario does exist
	if (instance_exists(obj_mario)) {
    
	    //Check for Mario
	    if (collision_rectangle(bbox_left, bbox_top-2, bbox_right, bbox_bottom-2, obj_mario, 1, 0)) {
    
	        //If Mario is not on this cloud
	        if (player_on == false)
	        && (can_on == true)
	        && (obj_mario.yspeed > 0)
			&& (obj_mario.oncloud == 0)
	        && (obj_mario.floatnow == 0)
	        && (obj_mario.state == playerstate.jump) {
        
	            //Force set 'Idle' state
	            with (obj_mario) {
            
	                //Set 'Idle' state
	                state = playerstate.idle;
                
	                //Set oncloud state
	                oncloud = true;
                
	                //Stop
	                yspeed = 0;
	                yadd = 0;
	            }
        
	            //Player is now on this cloud
	            player_on = true;
            
	            //This cloud cannot be ridden
	            can_on = false;
            
	            //Set vertical speed
	            vspeed = 0.5;
            
	            //Start timers
	            if (set == false) {
            
	                set = true;
	                alarm[0] = 30;
	                alarm[1] = 540;
	                alarm[2] = 720;
	            }
	        }
	    }
	}
#endregion

//Set depth
depth = -6;

//Check if Mario exists
if (instance_exists(obj_mario)) {
    
    //If Mario is on this cloud
    if (player_on == true) {
        
        //Force set player variables
		obj_mario.jumping = 0;
        obj_mario.jumpstyle = 0;
        obj_mario.oncloud = 1;
        
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
            
                    oncloud = false;
                    jumping = 1;
                    y--;
                    yspeed = -3.4675;
                }
                
                //Set vertical speed
                vspeed = 0.5;
                
                //Dismount from the cloud
                player_on = false;
                
                //Allow mount
                can_on = true;
            }
        }
    }
    
    //Wall collision
    event_user(3);
}

//Movement
event_user(0);
