/// @description Freeze NPCs

//Freeze
freeze = true;

//Remember animation
save_ims = image_speed;
image_speed = 0;

//Remember speed
save_sp = speed;
speed = 0;

//Remember direction
save_dir = direction
direction = 0;

//Remember alarms
for (var i=0; i<12; i++) {

	if (alarm[i] > -1) {
		
		save_alm[i] = max(alarm[i], 1);
		alarm[i] = -1;
	}
}
