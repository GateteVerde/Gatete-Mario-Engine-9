/// @description Chargin' Chuck

//Inherit the parent event
event_inherited();

//Turn towards walls?
turn_toward = -1;

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

//Whether this enemy is lookin' for Mario
lookout = -1;

//Whether this enemy is jumping a obstacle
jumping = 0;

//Do not animate
image_speed = 0;
image_index = 0;

//Make noises when chargin
alarm[0] = 6;

//Start moving
alarm[10] = 60;