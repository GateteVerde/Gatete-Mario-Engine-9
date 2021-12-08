/// @description Draw the surface

//If the prefreeze surface does not exist
if (!surface_exists(global.prefreeze)) {

	//Set the blending mode
	gpu_set_blendmode(bm_subtract);

	//Draw the surface
	draw_surface(surf_light, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));

	//Set the blending mode to normal
	gpu_set_blendmode(bm_normal);
}