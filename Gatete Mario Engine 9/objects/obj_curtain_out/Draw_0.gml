/// @description Draw the surface

//Set the blending mode
gpu_set_blendmode(bm_subtract);

//If the surface exists
if (surface_exists(surf)) {

	//Draw the transition image.
	draw_surface(surf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
}

//Set the blending end mode
gpu_set_blendmode(bm_normal);