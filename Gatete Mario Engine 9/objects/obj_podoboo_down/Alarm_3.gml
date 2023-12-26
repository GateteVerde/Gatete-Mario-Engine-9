/// @description Create cinder effect

//Repeat the process.
alarm[3] = 4;

//If the vertical speed is lower than 0.
if (vspeed > 0) {

    //Create cinder effect
    with (instance_create_depth(x+random_range(-4, 4), y+4, 175, obj_smoke)) {
		
		//Set the sprite
		sprite_index = (obj_levelcontrol.lava_palette > 0) ? spr_podoboo_alt_trail : spr_podoboo_trail;
    
        //Set the gravity
        gravity = 0.4;
		gravity_direction = 90;
    }
}
