/// @description Splittin' Chuck

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

//Offset
offset = 0;

//Split into 3
alarm[0] = 60;

//Deny alarm 10
alarm[10] = -1;