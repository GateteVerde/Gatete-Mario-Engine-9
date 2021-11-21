/// @description Deals with the application surface, window size, and fading.

//Disable alpha blending
gpu_set_blendenable(false);

//Draw a rectangle
draw_rectangle_colour(0, 0, global.gw*size, global.gh*size, c_black, c_black, c_black, c_black, 0);

//Draw the application surface
var focus_surface = (global.prefreeze == noone) ? application_surface : global.prefreeze;
draw_surface_stretched(focus_surface, 0, 0, global.gw*size, global.gh*size);

//Enable alpha blending
gpu_set_blendenable(true);