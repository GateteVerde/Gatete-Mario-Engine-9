/// @description Pidgit

/*
//	This enemy must be at least 128 pixels above the ground
*/

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 1;

//How vulnerable is this enemy to Mario?
stomp = 3;

//Whether the pidgit is moving
iammoving = 0;

//Timers
t = 0;
tready = 0;

//Handles hovering
hover = 0;

//Ready to move
move_ready = 0;

//Ready to attack
attack_ready = 0;

//Carpet frame
cframe = 0;

//Start moving
alarm[10] = 2;