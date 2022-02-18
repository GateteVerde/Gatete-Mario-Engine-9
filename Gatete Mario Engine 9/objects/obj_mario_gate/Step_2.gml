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
	
	//If not moving
	if (xspeed == 0) {

	    //Set the jumping sprite
	    sprite_index = global.clear_sprite[global.powerup];
    
	    //Do not animate
	    image_speed = 0;
		image_index = 0;
	}
	
	//Otherwise
	else if (xspeed != 0) {
	
		//Set the walking sprite
		sprite_index = global.walk_sprite[global.powerup];
		
		//Animate
		image_speed = 0.065+abs(xspeed)/7.5;
	}
}