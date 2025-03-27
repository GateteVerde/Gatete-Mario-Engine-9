/// @description Volley Chuck

//Inherit the parent event
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

//Whether chuck is throwing a ball
ready = 0;

//Whether chuck is tilting his head
loop = 0;

//Do not animate
image_speed = 0;

//Jump
alarm[0] = 60;

//Deny alarm 10
alarm[10] = -1;