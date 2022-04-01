/// @description Solid Balance Platform

//Whether this object is frozen
freeze = false;

//Makes the object fully solid
issolid = true;

//Makes the object not carry Mario or NPCs horizontally
no_horiz = false;

//Freeze variables
save_ims = 0;
save_hsp = 0;
save_vsp = 0;
save_grav = 0;
for (var i=0; i<12; i++) {

	save_alm[i] = -1;
}

//Prevent the object from falling too fast.
vspeedmax = 1;

//Set the parent of the other platform.
parent = noone;

//Make them fall
ready = 0;

//Create a rope that hangs both platforms.
rope = noone;

//Create the right pulley platform.
alarm[0] = 2;

//Create the rope
alarm[1] = 3;