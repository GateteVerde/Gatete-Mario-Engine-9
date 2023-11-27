/// @description Animate

//If moving vertically
if (vspeed != 0) {

    //Set the sprite
    sprite_index = global.spin_sprite[global.powerup];
    
    //Do not animate
    image_speed = 0;
    image_index = 0;
}

//Otherwise
else {

    //Animate
    image_speed = 0.15;    
    
    //Set the sprite
    if (holding == 0)
        sprite_index = global.walk_sprite[global.powerup];
    else
        sprite_index = global.hold_sprite[global.powerup];
}

//Set the mask
if (global.powerup == cs_tiny)
	mask_index = spr_mask_mario_tiny;
else {

	if (global.powerup == cs_small)
		mask_index = spr_mask_mario;
	else
		mask_index = spr_mask_mario_big;
}