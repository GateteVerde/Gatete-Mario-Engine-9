/// @description Platform logic

//Inherit the parent event
event_inherited();

//Arrow collision
if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_up, 0, 0))
    vspeed -= 0.0324;
else if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_down, 0, 0))
    vspeed += 0.0324;
else if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_left, 0, 0))
    hspeed -= 0.0324;
else if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_right, 0, 0))
    hspeed += 0.0324;