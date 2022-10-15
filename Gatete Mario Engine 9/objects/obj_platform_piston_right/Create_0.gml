/// @description Right Piston Platform

//Makes the object fully solid
issolid = false;

//Makes the object not carry Mario or NPCs horizontally
no_horiz = false;

//Depth
depth = 150;

//Default parent
parent = noone;

//Freeze variables
save_ims = 0;
save_hsp = 0;
save_vsp = 0;
save_grav = 0;
for (var i=0; i<12; i++) {

	save_alm[i] = -1;
}