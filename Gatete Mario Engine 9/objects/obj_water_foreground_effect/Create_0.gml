/// @description Underwater Ripple effect

//Set depth
depth = 450;

//Surface
surf = noone;

//Shader uniforms
uni_time = shader_get_uniform(shd_wave,"time");
var_time_var = 0;

uni_wave_amount = shader_get_uniform(shd_wave,"wave_amount");
uni_wave_distortion = shader_get_uniform(shd_wave,"wave_distortion");
uni_wave_speed = shader_get_uniform(shd_wave,"wave_speed");