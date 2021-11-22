/// @description Bubble logic

//If the bubble was not moving...
if (!ready) {

    //...and it's inside the view limits
    if (!outside_view()) {
        
        //Blink
        alarm[0] = 540;
        
        //Destroy
        alarm[1] = 720;
        
        //It's moving?
        ready = 1;
        
        //Set the vertical speed
        vspeed = 0.5;
        
        //Set the horizontal speed
        if (!instance_exists(obj_mario))
        || (obj_mario.x < x)
            hspeed = -0.5;
        else
            hspeed = 0.5;
    }
}

//Otherwise, if it's moving...
else if (ready) {

    //...and it's outside the view limits
    if (outside_view()) {
        
        //Create a respawn bubble with the same item
        with (instance_create_layer(xstart, ystart, "Main", obj_enemy_bubble_respawn)) sprout = other.sprout;
        
        //Destroy
        instance_destroy();
    }
    
    //If the bubble collides...
    if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 0, 0))
    || ((collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_semisolid, 0, 0)) && (vspeed > 0))
    || ((collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_slopeparent, 1, 0)) && (vspeed > 0))
        alarm[1] = 1;
}

//Wave up and down
if (y > ystart)
    vspeed -= 0.025;
else
    vspeed += 0.025;