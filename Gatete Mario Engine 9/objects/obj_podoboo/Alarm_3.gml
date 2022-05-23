/// @description Create cinder effect

//Repeat the process.
alarm[3] = 4;

//If the vertical speed is lower than 0.
if (yspeed < 0) {

    //Create cinder effect
    with (instance_create_depth(x+random_range(-4, 4), y+12, 175, obj_smoke)) {
		
		//Set the sprite
		sprite_index = spr_podoboo_trail;
    
        //Set the gravity
        gravity = 0.4;
    }
}
