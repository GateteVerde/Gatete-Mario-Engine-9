/// @description Time Up! sign

//Do not animate
image_speed = 0;
image_index = 2;

//Whether this object is at the middle of the screen
ready = 0;

//Depth
depth = -101;

//Set text position
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;

//Move to the bottom of the screen
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 8;