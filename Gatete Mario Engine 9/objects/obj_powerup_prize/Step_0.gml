/// @description Keep powerup in sight

//Stay 48 pixels below the top boundary
y = camera_get_view_y(view_camera[0]) + 48;

//If Mario exists, follow Mario
if (instance_exists(obj_mario))
	x = obj_mario.x;