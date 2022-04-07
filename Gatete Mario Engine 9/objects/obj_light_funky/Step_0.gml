/// @description Move around the view

//Set position
x = camera_get_view_x(view_camera[0]) + fx;
y = camera_get_view_y(view_camera[0]) + fy;

//Update position
fx += xspeed;
fy += yspeed;

//Reverse direction
if ((fx < 40) || (fx > global.gw - 40))
	xspeed = -xspeed;
if ((fy < 40) || (fy > global.gh - 40))
	yspeed = -yspeed;
