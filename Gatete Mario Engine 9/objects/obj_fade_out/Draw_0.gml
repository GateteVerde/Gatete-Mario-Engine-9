/// @description Draw the effect

//Set alpha
draw_set_alpha(alpha);

//Draw screen mask
draw_rectangle_colour(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 5016, 5000, c_black, c_black, c_black, c_black, 0);

//Reset alpha
draw_set_alpha(1);