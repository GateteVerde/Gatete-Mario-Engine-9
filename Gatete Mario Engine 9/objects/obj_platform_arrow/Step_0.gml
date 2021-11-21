/// @description Arrow platform generator logic

//If the player is on this moving platform
if ((collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0))
&& (obj_mario.bbox_bottom < yprevious+5)
&& (obj_mario.state < playerstate.jump)) {

    //If the generator did not spawned a platform yet
    if (ready == 0) {
    
        //First, destroy the old generated platform
        if (instance_exists(obj_platform_arrow_platform)) {
        
            with (obj_platform_arrow_platform)
                instance_destroy();
        }
        
        //Spawn it
        ready = 1;
        
        //Reset
        alarm[0] = 16;
    
        //Generate it
        with (instance_create_layer(x, y, "Main", obj_platform_arrow_platform)) {
        
            ready = 1;
            type = other.type;
        }
    }
}

//Make sure the platform gets the correct frame
image_index = type;