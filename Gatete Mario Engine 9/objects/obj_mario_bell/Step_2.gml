/// @description Set up the player's sprite

//If the player is moving vertically
if (yspeed != 0) {

    //Set the jumping sprite
    sprite_index = global.jump_sprite[global.powerup];
    
    //Animate
    image_speed = 0;
    if (yspeed < 0)
        image_index = 0;
    else
        image_index = 1;
}

//Otherwise, if the player is not moving vertically
else {

    //Set the jumping sprite
    sprite_index = global.walk_sprite[global.powerup];
    
    //Animate
    image_speed = 0.2;
}