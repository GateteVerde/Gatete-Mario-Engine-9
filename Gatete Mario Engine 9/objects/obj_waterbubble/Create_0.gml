/// @description A swimable water bubble

//Fake scaling
xscale = 1;
yscale = 1;

//Change scale
ready = 1;

//Set depth
depth = -6;

//Whether the object is or not frozen
freeze = false;

//Freeze variables
save_ims = 0;
save_hsp = 0;
save_vsp = 0;
save_grav = 0;
for (var i=0; i<12; i++) {

	save_alm[i] = -1;
}