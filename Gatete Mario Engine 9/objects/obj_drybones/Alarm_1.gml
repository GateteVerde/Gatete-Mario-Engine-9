/// @description Throw and start walking again

//If facing right, throw a bone to the right
if (xscale = 1) {

    with (instance_create_depth(x-2, y-6, depth - 1, obj_drybones_bone)) {
    
        image_xscale = -1;
        hspeed = 2;
    }
}

//Otherwise if facing left, throw a bone to the left
else if (xscale == -1) {

    with (instance_create_depth(x+2, y-6, depth - 1, obj_drybones_bone)) {
    
        image_xscale = 1;
        hspeed = -2;
    }    
}

//Wait for a bit
wait(60);

//Animate
image_speed = 1;
image_index = 0;

//Set the sprite
sprite_index = spr_drybones;

//Set horizontal speed
xspeed = 0.5 * sign(xscale);

//Throw a bone again
alarm[0] = 150;
