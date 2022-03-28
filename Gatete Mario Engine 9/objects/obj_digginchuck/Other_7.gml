/// @description Dig again after a while

//If the chuck is digging
if (sprite_index == spr_digginchuck_dig) {
    
    //Set the initial frame
    image_speed = 0;
    image_index = 2;
        
    //Ready
    ready = 0;
        
    //Decrement balls
    balls--;
        
    //Set normal sprite
    alarm[2] = 30;
        
    //Dig again
    if (balls > 0)
        alarm[0] = 90;        
    else {
        
        balls = 3;
        alarm[0] = 180;
    }        
}