/// @description SMW Cheep-Cheep (Horizontal)

//Inherit the parent event
event_inherited();

//Turn towards walls
turn_toward = 1;

//Do not unfreeze
freeze_object = -2;

//Sets turning endpoint
prevswim = 0;
xx = x;

//Flopping facing direction
flopdir = 1;

//Start moving or flop
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0))
    alarm[10] = 2;
