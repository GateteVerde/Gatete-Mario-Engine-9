/// @description Leaf Effect

//Do not animate
image_speed = 0;
image_index = choose(0, 1);

//Alpha
image_alpha = 1;
alarm[0] = 1;

//Set motion
vspeed = 0.25;
if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2)
	hspeed = -8;
else
	hspeed = 8;
