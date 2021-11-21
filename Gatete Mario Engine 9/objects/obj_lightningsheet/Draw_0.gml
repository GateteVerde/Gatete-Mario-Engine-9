/// @description Draw lightning sheet

//Set blend mode
gpu_set_blendmode(bm_add);

//Draw the sprite
draw_sprite_ext(sprite_index, image_index, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1.5, 1, 0, c_white, 0.5);

//Set blend mode to normal
gpu_set_blendmode(bm_normal);