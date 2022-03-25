/// @description Stop moving

if (yadd == 0) {
    
    //Stop animation
    sprite_index = spr_charginchuck;
    
    //Stop horizontal speed
    xspeed = 0;
    
    //Reset lookout
    lookout = -1;
    
    //Charge at the player again
    alarm[10] = 32;
}
else
    alarm[1] = 1;