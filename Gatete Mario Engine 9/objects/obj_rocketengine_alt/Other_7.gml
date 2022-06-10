/// @description Set up full engine

if (sprite_index == spr_rocketengine_st) {

    //Change sprite.
    sprite_index = spr_rocketengine;
    
    //Change light frame
    if (light != -1) {
        
        with (light) {
        
            image_speed = 0;
            image_index = 1;
        }
    }
    
    //Stop engine
    alarm[1] = 180;
}