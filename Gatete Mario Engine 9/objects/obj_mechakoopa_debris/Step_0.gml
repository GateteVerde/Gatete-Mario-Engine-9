/// @description Debris logic

//Cap vertical speed
if (vspeed > 4) {

    vspeed = 4;
    gravity = 0;
}

//Angle
angle -= 10*sign(hspeed);

//Destroy if outside the view
if (x < camera_get_view_x(view_camera[0]) - 16)
|| (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16)
|| (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 16)
    instance_destroy();
