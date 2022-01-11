/// @description Render shader

//Create surface
if (surf == noone) {
    
    surf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
}

//Update waves
var_time_var += 0.04;

//Set shader
shader_set(shd_wave);

//Set shader uniforms
shader_set_uniform_f(uni_time, var_time_var);
shader_set_uniform_f(uni_wave_amount, 10);
shader_set_uniform_f(uni_wave_distortion, 60);
shader_set_uniform_f(uni_wave_speed, 1);

//Draw surface
draw_surface_stretched(surf, camera_get_view_x(view_camera[0]), y, global.gw, room_height - camera_get_view_height(view_camera[0]));

//Reset shader
shader_reset();