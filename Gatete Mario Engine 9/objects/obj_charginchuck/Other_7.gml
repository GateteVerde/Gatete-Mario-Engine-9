/// @description Update animation

//If charging, reset up animation
if (sprite_index == spr_charginchuck_walk)
    image_index = 1;

//Otherwise, if damaged...
else if (sprite_index == spr_charginchuck_damage) {

    //Return to normal
    sprite_index = spr_charginchuck;

    //Stop animation
    image_speed = 0;
    
    //Charge at the player again
    alarm[10] = 60;
}