/// @description Create Mario

//If this ID is the same as the previous one
if (global.exit_id == myid) {
    
    //If the player warped from another room
    if (global.postchange != -1) {
    
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
                
                    //Create a player
                    mario = instance_create_depth(x, y, 150, obj_mario);
                    with (mario) {
                    
                        enable_gravity = false;
                        xscale = other.cannon;
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
        }
        
        //Reset warp
        global.postchange = -1;
    }
}