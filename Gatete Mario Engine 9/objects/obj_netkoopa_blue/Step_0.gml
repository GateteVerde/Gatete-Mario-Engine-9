/// @description Blue Net Koopa logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//If there's not a climbing spot
if ((xspeed < 0) && (!position_meeting(bbox_left-1, y, obj_climb)))
|| ((xspeed > 0) && (!position_meeting(bbox_right+1, y, obj_climb)))
|| ((yspeed < 0) && (!position_meeting(x, bbox_top-1, obj_climb)))
|| ((yspeed > 0) && (!position_meeting(x, bbox_bottom+1, obj_climb))) {

    //Reverse horizontal or vertical direction
    xspeed = -xspeed;
    yspeed = -yspeed;
}

//Wall collision
ai_npc_wall(1);

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
