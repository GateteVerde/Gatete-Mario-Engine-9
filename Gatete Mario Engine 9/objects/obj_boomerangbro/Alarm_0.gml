/// @description Jump

//If the boomerang bro is not holding a boomerang
if (sprite_index != spr_boomerangbro_throw) 
|| (sprite_index != spr_boomerangbro_throw_b) {
    
    //Set vertical speed
    yspeed = -2.5;
    
    //Gravity
    yadd = 0.25;    
    
    //Boost jump
    y--;
}

//Jump again
alarm[0] = 180 + random(round(60));