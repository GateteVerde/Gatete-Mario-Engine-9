/// @description Handle Lava Collision

//Start the raft if the player gets on the raft
if (ready == 0)
&& (collision_rectangle(bbox_left-length, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0))
    event_user(0)

//Stop the raft when running into a solid
else if (hspeed != 0) && (gravity == 0) {
    
    //If there's a solid to the right
    if (collision_rectangle(bbox_right, bbox_top, bbox_right, bbox_bottom-8, obj_solid, 0, 1)) {
        
        x = collision_rectangle(bbox_right, bbox_top, bbox_right, bbox_bottom-8, obj_solid, 0, 1).x-16;
        event_user(1);
    }
        
    //otherwise, if there's a solid to the left
    else if (collision_rectangle(bbox_left, bbox_top, bbox_left, bbox_bottom-8, obj_solid, 0, 1)) {
        
        x = collision_rectangle(bbox_left, bbox_top, bbox_left, bbox_bottom-8, obj_solid, 0, 1).x+16;
        event_user(2);
    }
}

//Ride lava
if ((collision_rectangle(x+8, bbox_bottom+1, x+8, bbox_bottom+4, obj_lava, 1, 0)) 
&& (!collision_rectangle(x+8, bbox_bottom-4, x+8, bbox_bottom-4, obj_lava, 1, 0)))
    y += 4;

//Handle lava collision
if (collision_rectangle(x+8, bbox_bottom-4, x+8, bbox_bottom-1, obj_lava, 1, 0)) 
&& (!collision_rectangle(x+8, bbox_bottom-8, x+8, bbox_bottom-8, obj_lava, 1, 0)) {

    //If the player is moving down onto a slope.
    if (vspeed > 0) {
    
        //Stop vertical movement
        vspeed = 0;
        gravity = 0;
    }
    
    //Prevent the player from getting embed inside a slope.
    if (vspeed > -0.85)
        while (collision_rectangle(x+8, bbox_bottom-4, x+8, bbox_bottom-1, obj_lava, 1, 0))        
            y--;
}
else
    gravity = 0.15;

//Cap fall speed
if (vspeed > 2.5)
    vspeed = 2.5;