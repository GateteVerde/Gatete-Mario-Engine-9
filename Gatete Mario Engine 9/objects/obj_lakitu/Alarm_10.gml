/// @description Prepare to enter into view

//Set vertical speed
yspeed = 1;

//Make it visible
visible = 1;

//Snap to the side of the screen that it is closest to
if (obj_levelcontrol.x > (xmax-xmin)/2+xmin)
    x = camera_get_view_x(view_camera[0]) - 64;
else
    x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 64;
