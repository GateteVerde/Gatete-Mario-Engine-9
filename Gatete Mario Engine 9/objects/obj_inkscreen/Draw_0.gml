/// @description Render it

draw_sprite_ext(sprite_index, image_index, screen_round(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2), screen_round(camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2), 1, 1, 0, c_white, alpha);
