/// @description Render me

//Draw
draw_self();

//Draw timer
if (time > 0)
	draw_sprite(spr_platform_timed_number, time, screen_round(x) + 16, screen_round(y) + 4);