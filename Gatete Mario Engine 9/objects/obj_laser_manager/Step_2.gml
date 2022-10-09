/// @description Laser logic

//If the statue can shoot
if (ready == 1) {
    
    //Check if Mario does exist
    if (instance_exists(obj_mario)) {
    
        //If Mario is inside the trigger area, generate the laser.
        if (obj_mario.bbox_left < x+8)
        && (obj_mario.bbox_right > x-8) {
        
            with (instance_create_depth(xstart-3, ystart+10, -2, obj_laser)) 
                motion_set(225, 6.5);
        }
    }
}