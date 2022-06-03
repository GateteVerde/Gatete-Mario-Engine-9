/// @description Ghost bubble logic

//Manage pseudo movement variables
if (freeze == false) {

	//Handle horizontal motion
	x += xspeed;

	//If the bubble is moving
	if (xspeed != 0) {
		
		y = ystart + sin(time * 0.0225) * 48;
		time++;
	}
}

//If not activated
if (active == 0)
&& (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]) - 32, camera_get_view_y(view_camera[0]) - 32, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32)) {

	//Activate
	active = 1;
	
	//Move towards Mario
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xspeed = -1;
	else
		xspeed = 1;
}

//Otherwise
else if (active > 0) {

	//If activated and outside the view
	if (active == 1)
	&& (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16))
		active = 2;
		
	//If outside the view after exiting it
	else if (active == 2)
	&& (outside_view() == true)
		instance_destroy();
}

//Handle scale
xscale += 0.01 * sign(ready);
yscale -= 0.01 * sign(ready);

//Change scale direction
if (xscale > 1.1)
	ready = -1;
else if (xscale < 0.9)
	ready = 1;
