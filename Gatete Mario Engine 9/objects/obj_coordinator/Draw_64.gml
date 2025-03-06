/// @description Deals with the application surface, window size, and fading.

//Disable alpha blending
gpu_set_blendenable(false);

//Set the shockwave shader
if (shock_enabled) {

    shader_set(shd_shockwave);
    var_time_var += 0.03;
}

//Set the shader uniforms
shader_set_uniform_f(uni_time, var_time_var);
shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
shader_set_uniform_f(uni_shock_amplitude, var_shock_amplitude);
shader_set_uniform_f(uni_shock_refraction, var_shock_refraction );
shader_set_uniform_f(uni_shock_width, var_shock_width);

//Render rectangle
draw_rectangle_colour(0, 0, global.gw * size, global.gh * size, c_black, c_black, c_black, c_black, 0);

//Draw the application surface
var focus_surface = (global.prefreeze == noone) ? application_surface : global.prefreeze;
draw_surface_stretched(focus_surface, 0, 0, global.gw * size, global.gh * size);

//Reset the shader
shader_reset();

//Enable alpha blending
gpu_set_blendenable(true);

//Display FPS
if (showfps) {
	
	draw_set_font(global.gui_font_menu);
	draw_text(2, 2, string(fps));
}