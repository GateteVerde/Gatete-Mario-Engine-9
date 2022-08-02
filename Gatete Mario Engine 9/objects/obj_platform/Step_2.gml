/// @description Platform logic

//If this platform has been generated, destroy at sides
if ((y < -32) || (y > room_height+32)) {
	
	instance_destroy();
	exit;
}

//Inherit the parent event
event_inherited();

//Arrow collision
if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_up, 0, 0)) && (freeze == false))
    vspeed -= 0.0324;
else if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_down, 0, 0)) && (freeze == false))
    vspeed += 0.0324;
else if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_left, 0, 0)) && (freeze == false))
    hspeed -= 0.0324;
else if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_right, 0, 0)) && (freeze == false))
    hspeed += 0.0324;
else if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_upleft, 0, 0)) && (freeze == false)) {
	
    vspeed -= 0.0324;
	hspeed -= 0.0324;
}
else if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_upright, 0, 0)) && (freeze == false)) {
	
    vspeed -= 0.0324;
	hspeed += 0.0324;
}
else if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_downleft, 0, 0)) && (freeze == false)) {
	
    vspeed += 0.0324;
	hspeed -= 0.0324;
}
else if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_downright, 0, 0)) && (freeze == false)) {
	
    vspeed += 0.0324;
	hspeed += 0.0324;
}