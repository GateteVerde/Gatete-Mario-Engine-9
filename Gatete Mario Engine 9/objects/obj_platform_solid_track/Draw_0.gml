/// @description Render me

//Increment anim
if (state != "IDLE") {
	
	anim += 0.0325;
}

//Draw the platform
draw_self();

//Draw the middle part
draw_sprite(spr_platform_solid_track_middle, anim, screen_round(bbox_left + bbox_right) / 2, y);