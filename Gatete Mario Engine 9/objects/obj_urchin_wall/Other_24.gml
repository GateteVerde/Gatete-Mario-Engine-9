/// @description Un-Freeze NPCs

//Unfreeze
freeze = false;

//Resume animation
image_speed = save_ims;
save_ims = 0;

//Resume speed
speed = save_sp;
save_sp = 0;

//Resume direction
direction = save_dir;
save_dir = 0;

//Remember alarms
for (var i=0; i<11; i++) {
	
	if (save_alm[i] > -1) {

		alarm[i] = max(save_alm[i], 1);
		save_alm[i] = -1;
	}
}
