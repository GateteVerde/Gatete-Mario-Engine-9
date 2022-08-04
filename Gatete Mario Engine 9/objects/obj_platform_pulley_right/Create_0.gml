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

//Freeze variables
save_ims = 0;
save_hsp = 0;
save_vsp = 0;
save_grav = 0;
for (var i=0; i<12; i++) {

	save_alm[i] = -1;
}