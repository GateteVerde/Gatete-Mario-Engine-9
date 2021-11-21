/// @description Draw the effect

//Draw the screenshot.
if (sprite_exists(back)) {

    //Disable alpha blending.
    gpu_set_blendenable(false);
    
    //Draw the screenshot
    draw_sprite(back, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
    
    //Enable alpha blending.
    gpu_set_blendenable(true);
}

//Set alpha
draw_set_alpha(alpha);

//Draw screen mask
draw_rectangle_colour(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 5000, 5000, c_black, c_black, c_black, c_black, 0);

//Reset alpha
draw_set_alpha(1);