/// @description Turn on enemies script

//Colliding horizontally
if ((hspeed < 0) && (collision_rectangle(bbox_left-hspeed*2, bbox_top, bbox_left, bbox_bottom, obj_enemyparent, 0, 1)))
|| ((hspeed > 0) && (collision_rectangle(bbox_right, bbox_top, bbox_right+hspeed*2, bbox_bottom, obj_enemyparent, 0, 1))) {

    //Reverse direction
    speed = -speed;
    
    //Reverse facing direction
    xscale = -xscale;
}

//Colliding vertically
if ((vspeed < 0) && (collision_rectangle(bbox_left, bbox_top-vspeed*2, bbox_right, bbox_top, obj_enemyparent, 0, 1)))
|| ((vspeed > 0) && (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+vspeed*2, obj_enemyparent, 0, 1))) {

    //Reverse direction
    speed = -speed;
    
    //Reverse facing direction
    xscale = -xscale;
}
