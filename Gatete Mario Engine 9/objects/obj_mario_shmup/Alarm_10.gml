/// @description Initialize Autoscroll

//Create autoscroll object
with (instance_create_layer(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, "Main", obj_autoscroll)) {
	
	speed = 1;
	maxspd = 1;
	follow_y = 1;
	alarm[2] = -1;
}