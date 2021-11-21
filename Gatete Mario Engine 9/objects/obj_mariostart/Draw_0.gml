/// @description Draw "Mario Start!" text

//Draw rectangle
draw_rectangle_colour(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 5000, 5000, c_black, c_black, c_black, c_black, 0);

//Draw "Mario Start"
draw_sprite_ext(sprite_index, image_index, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, 1, 1, 0, c_white, 1);