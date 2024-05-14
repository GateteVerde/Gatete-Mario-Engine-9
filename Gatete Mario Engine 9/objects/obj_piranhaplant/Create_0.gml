/// @description Piranha Plant

//Inherit event from parent
event_inherited();

//How vulnerable is this enemy to Mario?
stomp = 2;

//Freeze object
freeze_object = -2;

//Ignore all platforms
ignore_platforms = true;

//Manage movement
ready = 0;

//Start moving
alarm[0] = 60;

//Stay always behind pipes
depth = 150;