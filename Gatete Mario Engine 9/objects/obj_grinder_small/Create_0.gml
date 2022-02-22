/// @description Small Grinder

//Inherit the parent event (Please refer to the flags on this event when creating a enemy too)
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 2;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How edible is this enemy to Yoshi?
edible = 2;

//Does this enemy turn into a silver coin?
turn_silver = 0;

//Do not swim
noswim = 1;
	
//Do noises
alarm[0] = 7;

//Move towards Mario
alarm[10] = 2;