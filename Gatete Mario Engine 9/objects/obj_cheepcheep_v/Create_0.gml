/// @description SMW Cheep-Cheep (Vertical)

//Inherit the parent event
event_inherited();

//Turn towards walls
turn_toward = 1;

//Sets turning endpoint
prevswim = 0;
yy = y;

//Flopping facing direction
flopdir = 1;

//Start moving or flop
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0))
    alarm[10] = 2;
