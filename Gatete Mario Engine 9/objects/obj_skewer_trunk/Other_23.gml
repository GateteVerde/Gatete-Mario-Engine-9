/// @description Freeze Platform

//Freeze
freeze = true;

//Remember animation
save_ims = image_speed;
image_speed = 0;

//Remember horizontal speed
save_hsp = hspeed;
hspeed = 0;

//Remember vertical speed
save_vsp = vspeed;
vspeed = 0;

//Remember gravity
save_grav = gravity;
gravity = 0;

//Remember alarms
for (var i=0; i<12; i++) {

	if (alarm[i] > -1) {
		
		save_alm[i] = max(1, alarm[i]);
		alarm[i] = -1;
	}
}