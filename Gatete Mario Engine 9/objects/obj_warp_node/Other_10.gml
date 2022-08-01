/// @description Create Mario

//If this ID is the same as the previous one
if (global.exit_id == myid) {
    
    //If the player warped from another room
    if (global.postchange != -1) {
		
		//Set autoscroll position
		if (instance_exists(obj_autoscroll)) {
		
			with (obj_autoscroll) {
			
				x = other.scroll_x;
				y = other.scroll_y;
			}
		}
    
        //Destroy player objects
        event_user(1);
        
        //Switch between warp types
        switch (global.postchange) {
        
            //Normal
            case (0): instance_create_depth(x, y, -5, obj_mario); break;
            
            //Warp
            case (1): {
            
                //If the player is going to be shot with a cannon
				if (cannon != "No") {
					
					//Create Mario
					mario = instance_create_layer(x, y, "Main", obj_mario);
					with (mario) {
					
						//Disable it's gravity
						enable_gravity = false;
						
						//Set depth
						depth = 150;
						
						//Set facing direction
						if (other.cannon == "Diagonal Right")
							xscale = 1;
						else
							xscale = -1;
					}
                
                    //Blast off
                    alarm[0] = 32;
                    
                    //Put camera in position
                    if (instance_exists(obj_levelcontrol)) {
                    
                        obj_levelcontrol.x = x;
                        obj_levelcontrol.y = y;
                    }
                }
            
                //Otherwise, warp normally
                else {
                    
                    //Create a moving warp object
                    with (instance_create_depth(x, y, 150, obj_mario_warp)) {
                        
                        //Direction
                        direction = global.exit_dir;
                        
                        //Disallow move
                        canmove = 0;
                        alarm[1] = 32;
                        
                        //Allow exit from pipe
                        ready = 1;                
                    }
                }
            } break;
			
			//Jump
			case (2): instance_create_depth(x, y, -5, obj_mario_jump); break;
			
			//Climb
			case (3): instance_create_depth(x, y, -5, obj_mario_climb); break;
			
			//Rocket
			case (4): instance_create_depth(x, y, -5, obj_mario_rocket); break;
        }
        
        //Reset warp
        global.postchange = -1;
    }
}