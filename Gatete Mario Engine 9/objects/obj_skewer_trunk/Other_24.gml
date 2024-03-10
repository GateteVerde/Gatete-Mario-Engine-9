/// @description Un-Freeze Platform

//Unfreeze
freeze = false;

//Resume animation
image_speed = save_ims;
save_ims = 0;

//Resume horizontal speed
hspeed = save_hsp;
save_hsp = 0;

//Resume vertical speed
vspeed = save_vsp;
save_vsp = 0;

//Resume gravity
gravity = save_grav;
save_grav = 0;

//Remember alarms
for (var i=0; i<11; i++) {
	
	if (save_alm[i] > -1) {

		alarm[i] += save_alm[i];
		save_alm[i] = -1;
	}
}