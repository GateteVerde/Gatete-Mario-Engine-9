/// @description Right Balance Platform

//Makes the object fully solid
issolid = false;

//Makes the object not carry Mario or NPCs horizontally
no_horiz = false;

//Prevent the object from falling too fast.
vspeedmax = 1;

//Set the parent of the other platform.
parent = noone;

//Make them fall
ready = 0;

//Create a rope that hangs both platforms.
rope = noone;

//Create the rope
alarm[1] = 3;