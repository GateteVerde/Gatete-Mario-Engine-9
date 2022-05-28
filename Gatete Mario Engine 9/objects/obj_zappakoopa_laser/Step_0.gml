/// @description Laser logic

//Destroy if the parent does not exist
if (!instance_exists(parent)) {

    instance_destroy();
    exit;
}

//If the beam is not ready
if (beam == 0) {
  
    //If the parent is facing right  
    if (parent.xscale > 0) {
        
        //If there's a solid on the way
        if (((collision_point(x, y, obj_solid, 0, 0)) || (collision_point(x, y, obj_slopeparent, 1, 0))) 
        || (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16)) {
        
            move_snap(4, 1);
            beam = 1;
            alarm[0] = 60;
        }
        else {
        
            x += 8;
            length += 8;
        }
    }
    
    //Otherwise, if the parent is facing left
    else if (parent.xscale < 0) {
        
        //If there's a solid on the way
        if (((collision_point(x, y, obj_solid, 0, 0)) || (collision_point(x, y, obj_slopeparent, 1, 0))) 
        || (x < camera_get_view_x(view_camera[0])-16)) {
        
            move_snap(4, 1);
            beam = 1;
            alarm[0] = 60;
        }
        else {
        
            x -= 8;
            length -= 8;
        }
    }
}

//Check for Mario and hurt him
player = collision_rectangle(xstart, y-4, xstart+length, y+4, obj_mario, 0, 0)
if (player)
    with (player) event_user(0);
