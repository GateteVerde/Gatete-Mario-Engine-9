/// @description Render screenshot and fade in

//Render screenshot
freeze_render();

//Set the alpha
draw_set_alpha(alpha);

//Draw screen mask
draw_rectangle_colour(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), global.gw * obj_coordinator.size, global.gh * obj_coordinator.size, c_black, c_black, c_black, c_black, 0);

//Reset alpha
draw_set_alpha(1);