/// @description Superball logic

//Manage movement
x += xspeed;
y += yspeed;

//If moving down
if (yspeed > 0) 
&& (place_meeting(x+xspeed, y+yspeed, obj_slopeparent)) {

	xspeed = -xspeed;
	yspeed = -yspeed;
}

//Horizontal collision
if ((xspeed < 0) && (collision_rectangle(bbox_left+xspeed, bbox_top, bbox_left+xspeed, bbox_bottom, obj_solid, 0, 0)))
|| ((xspeed > 0) && (collision_rectangle(bbox_right+xspeed, bbox_top, bbox_right+xspeed, bbox_bottom, obj_solid, 0, 0)))
	xspeed = -xspeed;
	
//Vertical collision
if ((yspeed < 0) && (collision_rectangle(bbox_left, bbox_top+yspeed, bbox_right, bbox_top+vspeed, obj_solid, 0, 0)))
|| ((yspeed > 0) && (collision_rectangle(bbox_left, bbox_bottom+yspeed, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0)))
	yspeed = -yspeed;