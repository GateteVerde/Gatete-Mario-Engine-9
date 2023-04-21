/// @description Display logo

//If the logo can display
if (display) {

	draw_sprite_ext(spr_logo, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, 1, 1, 0, c_white, 1);
}