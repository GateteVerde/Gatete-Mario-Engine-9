/// @description Boo Stream logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region COLLISION

	//Bounce horizontally
	if ((xspeed < 0) && (collision_rectangle(bbox_left+xspeed, bbox_top, bbox_left, bbox_bottom, obj_solid, 0, 0)))
	|| ((xspeed > 0) && (collision_rectangle(bbox_right, bbox_top, bbox_right+xspeed, bbox_bottom, obj_solid, 0, 0)))
	    xspeed = -xspeed;
    
	//Bounce vertically
	if ((yspeed < 0) && (collision_rectangle(bbox_left, bbox_top+yspeed, bbox_right, bbox_top, obj_solid, 0, 0)))
	|| ((yspeed > 0) && (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0)))
	    yspeed = -yspeed;

	//Bounce off slopes
	if ((yspeed > 0) && (place_meeting(x+xspeed, y+yspeed, obj_slopeparent)))
	|| ((yspeed < 0) && (place_meeting(x-xspeed, y-yspeed, obj_slopeparent_ceiling))) {

	    xspeed = -xspeed;
	    yspeed = -yspeed;
	}
#endregion

//Facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;
