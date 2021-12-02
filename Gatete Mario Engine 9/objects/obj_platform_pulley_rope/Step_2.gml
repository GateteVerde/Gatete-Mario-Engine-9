/// @description Balance Platform Rope logic

var platform = collision_rectangle(x, y+1, x, y+room_height, obj_platform_pulley, 0, 0);

//If the rope is still hanging the platform
if (ready = 0) {
    
    if (platform) {
    
        if (platform.ready == true) {
    
            //Make both platforms fall.
            ready = true;
            
            //Set the scale of the platform
            scale = platform.y-y;
        }
        else if (platform.ready == false)
            scale = platform.y-y;
    }
    else
        exit;
}