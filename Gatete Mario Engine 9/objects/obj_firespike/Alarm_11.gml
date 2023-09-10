/// @description Follow the player

//If not falling
if (yadd == 0) {
    
    //If moving horizontally
    if (xspeed != 0) {
    
        //Move towards Mario
        if (!instance_exists(obj_mario))
        || (obj_mario.x < x)
            xspeed = (swimming) ? -0.25 : -0.5;
        else
            xspeed = (swimming) ? 0.25 : 0.5;
    }
}

//Change direction
alarm[11] = 60+round(random_range(60,120));