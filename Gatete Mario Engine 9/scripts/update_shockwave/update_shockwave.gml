/// @function update_shockwave()

function update_shockwave() {

	uni_resolution = shader_get_uniform(shd_shockwave, "resolution");
	var_resolution_x = camera_get_view_width(view_camera[0]);
	var_resolution_y = camera_get_view_height(view_camera[0]);
}