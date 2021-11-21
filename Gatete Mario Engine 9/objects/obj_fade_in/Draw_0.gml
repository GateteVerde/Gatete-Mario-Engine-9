/// @description Draw the effect

//Draw the screenshot.
if (sprite_exists(snapshot)) {
    
    //Draw the screenshot
    draw_sprite_ext(snapshot, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1 / obj_coordinator.size, 1 / obj_coordinator.size, 0, c_white, 1);
}

//Set the alpha
draw_set_alpha(alpha);

//Draw screen mask
draw_rectangle_colour(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 5000, 5000, c_black, c_black, c_black, c_black, 0);

//Reset alpha
draw_set_alpha(1);