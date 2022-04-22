/// @description Leaf effect logic

//Update time
time += rate;

//Manage movement
x += sin(time);
y += abs(sin(time)) / 2.5;
image_xscale = 1 * sign(x-xprevious);

//Destroy when outside
if (x < camera_get_view_x(view_camera[0]) - 600)
|| (x > camera_get_view_x(view_camera[0]) + (global.gw + 600))
	instance_destroy();
