/// @description Freeze NPCs

//Freeze
freeze = true;

//Remember animation
save_ims = image_speed;
image_speed = 0;

//Remember horizontal speed
save_xsp = xspeed;
xspeed = 0;

//Remember vertical speed
save_ysp = yspeed;
yspeed = 0;

//Remember gravity
save_grav = yadd;
yadd = 0;

//Remember alarms
for (var i=0; i<12; i++) {

	if (alarm[i] > -1) {
		
		save_alm[i] = max(alarm[i], 1);
		alarm[i] = -1;
	}
}
