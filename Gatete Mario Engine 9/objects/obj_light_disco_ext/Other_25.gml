/// @description Render light

//Draw the circle
draw_circle_colour(x - camera_get_view_x(view_camera[0]) - 1, y - camera_get_view_y(view_camera[0]), 8, image_blend, image_blend, false);

//Begin primitive
draw_primitive_begin(pr_trianglefan);

//Draw vertexs
draw_vertex(x - camera_get_view_x(view_camera[0]) - 8, y - camera_get_view_y(view_camera[0]));
draw_vertex(x - camera_get_view_x(view_camera[0]) - 92 - xx, y - camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 48);
draw_vertex(x - camera_get_view_x(view_camera[0]) + 91 - xx, y - camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 48);
draw_vertex(x - camera_get_view_x(view_camera[0]) + 8, y - camera_get_view_y(view_camera[0]));

//End primitive
draw_primitive_end();