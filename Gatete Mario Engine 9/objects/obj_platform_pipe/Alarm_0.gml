/// @description Start moving

//If Mario does not exist
if (!instance_exists(obj_mario)) {

    alarm[0] = 1;
    exit;
}

//If the player is nearby
if (obj_mario.x > bbox_left-32)
&& (obj_mario.x < bbox_right+32) {
        
    //If there's a 'Up' modifier in place, move up.
    if (collision_rectangle(bbox_left, bbox_top, bbox_right, y+15, obj_up, 0, 0))
        vspeed = -1;
        
    //Otherwise, there's a 'Down' modifier in place,  move down.
    else if (collision_rectangle(bbox_left, bbox_top, bbox_right, y+15, obj_down, 0, 0))
        vspeed = 1;
}
else {

    alarm[0] = 1;
    exit;
}