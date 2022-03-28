/// @description Update animation

//If charging, reset up animation
if (sprite_index == spr_whistlinchuck)
    image_index = 1;

//Otherwise, if damaged...
else if (sprite_index == spr_charginchuck_damage) {

    //Return to normal
    sprite_index = spr_whistlinchuck;

    //Whistle
    ready = 1;
    
    //Start whistling again
    alarm[0] = 90;
}