/// @description Bowlin' Chuck

//Inherit event from chuck
event_inherited();

//How vulnerable is this enemy to Mario?
stomp = 4;

//How edible is this enemy to Yoshi?
edible = 2;

//Does this enemy turn into a silver coin?
turn_silver = 0;

//NPC Health
hp = 2;
firehp = 4;

//Whether the chuck is about to kick
ready = 0;

//Do not animate
image_speed = 0;
image_index = 1;

//Prepare a ball
alarm[0] = 60;

//Deny alarm 10
alarm[10] = -1;