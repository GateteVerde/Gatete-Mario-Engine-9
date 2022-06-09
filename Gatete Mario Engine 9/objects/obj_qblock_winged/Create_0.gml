/// @description Winged Question Mark Block

//Makes the object fully solid
issolid = true;

//Makes the object not carry Mario or NPCs horizontally
no_horiz = false;

//Whether the block is ready
ready = 0;

//Direction
dir = -1;

//Anim
anim = 0;

//Question Mark position
xx = xstart;

//Freeze variables
save_ims = 0;
save_hsp = 0;
save_vsp = 0;
save_grav = 0;
for (var i=0; i<12; i++) {

	save_alm[i] = -1;
}

//Start moving
alarm[0] = 2;