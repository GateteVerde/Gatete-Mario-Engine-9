/// @function init_shockwave()

function init_shockwave() {

	//Getting the shader uniforms and setting the necessary variables
	uni_time = shader_get_uniform(shd_shockwave, "time");
	var_time_var = 0;

	uni_mouse_pos = shader_get_uniform(shd_shockwave, "mouse_pos");
	var_mouse_pos_x = mouse_x;
	var_mouse_pos_y = mouse_y;

	uni_resolution = shader_get_uniform(shd_shockwave, "resolution");
	var_resolution_x = camera_get_view_width(view_camera[0]);
	var_resolution_y = camera_get_view_height(view_camera[0]);

	uni_shock_amplitude = shader_get_uniform(shd_shockwave, "shock_amplitude");
	var_shock_amplitude = 5;

	uni_shock_refraction = shader_get_uniform(shd_shockwave, "shock_refraction");
	var_shock_refraction = 0.4;

	uni_shock_width = shader_get_uniform(shd_shockwave, "shock_width");
	var_shock_width = 0.05;

	shock_enabled = false;
}