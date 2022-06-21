/// @description Handles surfaces

//Render snapshot
freeze_render();

//Draw alpha
draw_set_alpha(0.2);

//Draw rectangle
draw_rectangle_colour(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);

//Reset alpha
draw_set_alpha(1);