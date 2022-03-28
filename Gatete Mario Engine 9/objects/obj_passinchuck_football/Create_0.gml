/// @description Football

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 0;

//How vulnerable is this enemy to Mario?
stomp = 0;

//How edible is this enemy to Yoshi?
//0:	Edible
//1:	Edible, but create a item
//2:	Non-Edible
edible = 0;

//Jumps
jumping = 0;

//Do not animate
image_speed = 0;
image_index = 0;

//Deny movement
alarm[10] = -1;