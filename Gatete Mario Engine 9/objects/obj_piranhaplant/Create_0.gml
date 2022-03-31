/// @description Piranha Plant

//Inherit event from parent
event_inherited();

//How vulnerable is this enemy to Mario?
stomp = 2;

//Manage movement
ready = 0;

//Start moving
alarm[0] = 60;

//Stay always behind pipes
depth = 150;