/// @description Start moving

//Stop moving
alarm[1] = 120;

//If the boo didn't moved before, move towards Mario
if (prevxspeed == 0) {

    //If the player does not exist or it's moving left
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xspeed = -1;
    else
        xspeed = 1;
}

//Otherwise, set the previously set horizontal speed
else
    xspeed = prevxspeed;
