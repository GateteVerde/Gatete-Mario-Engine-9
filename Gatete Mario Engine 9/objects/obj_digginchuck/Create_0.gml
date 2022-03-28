/// @description Diggin' Chuck

//Inherit event from chuck
event_inherited();

//How vulnerable is this enemy to Mario?
stomp = 4;

//How edible is this enemy to Yoshi?
//0:	Edible
//1:	Edible, but create a item
//2:	Non-Edible
edible = 2;

//Does this enemy turn into a silver coin?
turn_silver = 0;

//NPC Health
hp = 2;
firehp = 4;

//Mud balls to dig
balls = 3;

//Whether the chuck is about to dig
ready = 0;

//Animate
image_speed = 0;

//Dig
alarm[0] = 60;

//Deny alarm 10
alarm[10] = -1;