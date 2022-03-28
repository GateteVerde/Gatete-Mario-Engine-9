/// @description Start digging

//If Mario does exist...
if (instance_exists(obj_mario)) {
    
    //Set diggin sprite
    sprite_index = spr_digginchuck_dig;
    image_speed = 0;
    image_index = 0;
    
    //Draw the ball
    ready = 1;
        
    //Generate it
    alarm[1] = 30;
}
else
    alarm[0] = 1;
