/// @description Cannonball logic

//If the cannonball is outside the view
if (ready == 0)
&& (y < camera_get_view_y(view_camera[0]) - 32) {

	ready = 1;
	alarm[0] = 240;
}