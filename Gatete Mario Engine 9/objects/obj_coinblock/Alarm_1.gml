/// @description Delay visibility and set trajectory

//Make it visible
visible = 1;

//Set horizontal motion
hspeed = -(xstart - (camera_get_view_x(view_camera[0]) + 20)) / (room_speed * 1.6);

//Set vertical motion
vspeed = -4;
gravity = 0.1;