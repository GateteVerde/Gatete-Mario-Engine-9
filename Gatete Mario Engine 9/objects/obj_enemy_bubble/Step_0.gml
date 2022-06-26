/// @description Bubble logic

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

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
        yspeed = 0.5;
        
        //Set the horizontal speed
        if (!instance_exists(obj_mario))
        || (obj_mario.x < x)
            xspeed = -0.5;
        else
            xspeed = 0.5;
    }
}

//Otherwise, if it's moving...
else if (ready) {

    //...and it's outside the view limits
    if (outside_view() == true) {
        
        //Create a respawn bubble with the same item
        with (instance_create_layer(xstart, ystart, "Main", obj_enemy_bubble_respawn)) sprout = other.sprout;
        
        //Destroy
        instance_destroy();
    }
    
    //If the bubble collides...
    if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 0, 0))
    || ((collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_semisolid, 0, 0)) && (yspeed > 0))
    || ((collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_slopeparent, 1, 0)) && (yspeed > 0))
        alarm[1] = 1;
}

#region FACING DIRECTION

	if (xspeed > 0)
		xscale = 1;
	else if (xspeed < 0)
		xscale = -1;
#endregion

//Wave up and down
if (y > ystart)
    yspeed -= 0.025;
else
    yspeed += 0.025;