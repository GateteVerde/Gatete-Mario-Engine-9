/// @description Move up if inside the view

//Animate and move up
image_speed = 0.2;
if (y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) {

    vspeed = -3;
    gravity = 0.1;
}