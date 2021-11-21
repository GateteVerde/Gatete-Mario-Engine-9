/// @description Castle Platform

//Makes the object fully solid
issolid = true;

//Makes the object not carry Mario or NPCs horizontally
no_horiz = false;

//Whether this platform is moving
ready = 0;

//Find the nearest semisolid collision
sm = collision_rectangle(bbox_left, y, bbox_right, y + room_height, obj_semisolid, 0, 0);
if (sm)
	y = sm.y;