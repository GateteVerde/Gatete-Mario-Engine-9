/// @description Draw beam effect

//Set the blend mode
gpu_set_blendmode(bm_add);

//Draw the sprite
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y), scale, scale, 0, c_white, alpha);

//Reset the blend mode
gpu_set_blendmode(bm_normal);
