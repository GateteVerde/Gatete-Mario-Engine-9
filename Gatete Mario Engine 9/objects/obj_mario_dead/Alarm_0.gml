/// @description Move up if inside the view

image_speed = 0.2;
if (y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) {

    vspeed = -6;
    gravity = 0.2;
}