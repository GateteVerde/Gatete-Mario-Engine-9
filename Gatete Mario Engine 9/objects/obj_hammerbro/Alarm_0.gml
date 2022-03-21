/// @description Jump upwards / downwards

//If there's a row of blocks above and below the hammer bro.
if (collision_rectangle(bbox_left, bbox_top-40, bbox_right, bbox_top-40, obj_blockparent, 0, 0))
&& (collision_rectangle(bbox_left, bbox_bottom+8, bbox_right, bbox_bottom+8, obj_blockparent, 0, 0)) {

    //Set the vertical speed
    if (floor(random(50)) < 25) {
    
        yspeed = -6;
        alarm[3] = 2;
        alarm[4] = 16;
    }
    else {
    
        yspeed = -2.5;
        alarm[3] = 2;
        alarm[4] = 35;
    }
}

//Otherwise, check where's the blocks and jump up or down.
else {

    //If the blocks are above
    if (collision_rectangle(bbox_left, bbox_top-40, bbox_right, bbox_top-40, obj_blockparent, 0, 0)) {
    
        yspeed = -6;
        alarm[3] = 2;
        alarm[4] = 16;
    }
    
    //Otherwise, if they are below
    else if (collision_rectangle(bbox_left, bbox_bottom+8, bbox_right, bbox_bottom+8, obj_blockparent, 0, 0)) {
    
        yspeed = -2.5;
        alarm[3] = 2;
        alarm[4] = 35;
    }
    else
        yspeed = -6;
}

//Boost jump
y--;

//Gravity
yadd = 0.25;

//Jump again
alarm[0] = 180 + random(round(60));