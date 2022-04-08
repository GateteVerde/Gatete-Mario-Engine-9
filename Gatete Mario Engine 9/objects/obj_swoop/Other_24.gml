/// @description Un-Freeze NPCs

//Unfreeze
freeze = false;

//Resume animation
image_speed = save_ims;
save_ims = 0;

//Resume horizontal speed
hspeed = save_xsp;
save_xsp = 0;

//Resume vertical speed
vspeed = save_ysp;
save_ysp = 0;

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
