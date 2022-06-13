/// @description Move towards Mario

//Move towards Mario
if (xspeed == 0) {

    //If Mario does not exist or it's at the left
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xspeed = -1;
    else
        xspeed = 1;
}

//If in contact with a slippery surface, chaaaaarge... otherwise, turn around
if (collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+1, obj_slippery, 0, 0))
    charge = 1;
else
    alarm[11] = 60;