/// @description Micro Goomba logic

if (ready == 0) {

    //Check for Mario
    mario = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0);
    if (mario) {
    
        //Move towards mario
        ready = 1;
        
        //Stop the path movement
        path_end();
        
        //Stay for 3 seconds
        alarm[0] = 180;
        
        //Snap into position
        if (global.powerup == cs_small)
            yfix = random_range(0, 8);
        else
            yfix = random_range(-8, 8);
    }
}
else {
    
    //Set up the position.
    if (instance_exists(obj_mario)) {
    
        //Snap to position
        x = obj_mario.x+xfix;
        y = obj_mario.y+yfix;
    
        //If Mario is not swimming
        if (obj_mario.swimming == false) {
        
            //Set up the position of the microgoomba
            if (ready = 1) {
            
                xfix += 0.5;
                if (xfix > 9) {
                
                    ready = 2;
                    depth = -4;
                }
            }
            else if (ready = 2) {
            
                xfix -= 0.5;
                if (xfix < -9) {
                
                    ready = 1;
                    depth = -6;
                }
            }
            
            //If Mario jumps and the 'random' variable hits 1
            if (obj_mario.jumping = 1) {
            
                if (flee) {
                
                    event_user(0);
                    exit;
                }
                
                //Prevent mario from jumping
                obj_mario.jumping = 2;
                
                //Set the vertical speed.
                obj_mario.yspeed = -1.5;                
            }
        }
        
        //Otherwise, if Mario is swimming
        else
            event_user(0);
    }
    else
        event_user(0);
}

//Destroy when outside the view
if (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32)
    instance_destroy();