/// @description Blue Super Koopa

//Inherit the parent event
event_inherited();

//Previous y position
jumpy = y;

//Whether this enemy jumped
jumping = 0;

//Makes cape flash if this enemy gives a feather
isflashing = 0;
alarm[1] = 2;

//Start moving
alarm[10] = 2;