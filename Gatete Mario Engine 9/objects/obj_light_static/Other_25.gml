/// @description Render light

if (sprite_index == -1)
	draw_circle_gradual(x - camera_get_view_x(view_camera[0]), y - camera_get_view_y(view_camera[0]), radius, 16, image_blend, c_black, 1, 0);
else
	draw_sprite_ext(sprite_index, -1, x - camera_get_view_x(view_camera[0]), y - camera_get_view_y(view_camera[0]), 1, 1, angle, c_white, 1);