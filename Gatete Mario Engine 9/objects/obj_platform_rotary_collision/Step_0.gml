/// @description Set up the direction of Mario

//If the platform is spinning
if (spin == 1) {

    //With Mario
    with (obj_mario) {
    
        //Stay relative to the platform.
        x = other.x;
        y = other.y;
        
        //Set horizontal speed
        xspeed = other.hspeed;
        
        //Set vertical speed
        yspeed = other.vspeed;
    }
}

//Change the direction
direction += 20.7925