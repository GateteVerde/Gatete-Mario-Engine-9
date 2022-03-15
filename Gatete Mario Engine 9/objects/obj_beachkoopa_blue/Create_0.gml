/// @description Blue Beach Koopa

//Inherit event from parent
event_inherited();

//How vulnerable is this enemy to items
vulnerable = 0;

//How vulnerable is this enemy to the player
stomp = 0;

//How vulnerable is this enemy to Yoshi
edible = 0;

//Whether this enemy is stunned
ready = 1;

//Object it is holding
idd = noone;

//Kick State
kicky = 0;

//Sliding
slide = 0;
alarm[0] = 1;
alarm[1] = 1;

//Move towards the player
alarm[10] = 2;

//If the item is overlapping the koopa
initem = false;
dir = -1;