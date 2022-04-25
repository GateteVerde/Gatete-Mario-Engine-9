/// @description Draw a rectangle

//If enabled
if (blink_on == 1) {

	//Blend
	gpu_set_blendmode(bm_add);

	//Set colour
	draw_set_colour(choose(make_colour_rgb(248, 232, 136), make_colour_rgb(216, 248, 248), make_colour_rgb(136, 176, 240)));

	//Set alpha
	draw_set_alpha(0.25);

	//Draw rectangle
	if (blink != 0) {
	
		draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), false);
	}

	//Reset alpha
	draw_set_alpha(1);

	//Reset blend
	gpu_set_blendmode(bm_normal);
}
