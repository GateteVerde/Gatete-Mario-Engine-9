/// @description Net koopa logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//If the koopa is not turning and climbs off the net
if (turnaround = 0) {

    ///If moving down
    if (yspeed > 0) 
    && (!collision_line(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_climb, 0, 0)) {
    
        yspeed = -yspeed;
        if (ready != 2)
            ready = 2;
    }
    
    //Otherwise
    else if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_climb, 0, 0)) {
    
        //Turn sprite
        sprite_index = spr_netkoopa_red_turn;
        
        //Turning
        turnaround = 1;
    
        //Do not animate
        image_speed = 0;
    
        //Stop
		xspeed = 0;
        yspeed = 0;
    
        //Finish turning
        alarm[0] = 10;
    
        //Turn image index
        if ((ready == 0) || (ready == 3))
            image_index = 0;
        else
            image_index = 1;
    }
}

//Wall collision
ai_npc_wall(0);

//If moving up and there's a ceiling in place
if (yspeed < 0) {

    if (collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top, obj_solid, 0, 0))
    || (collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top, obj_slopeparent_ceiling, 1, 0)) {
    
        //Prevent getting embed on ceiling
        while (collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top, obj_solid, 0, 0))
            y++;
            
        //Reverse vertical movement
        yspeed = -yspeed;
    }
}

//Otherwise,  if moving down and there's a semisolid in place
else if (yspeed > 0)  
&& (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_semisolid, 0, 0))
    yspeed = -yspeed;
