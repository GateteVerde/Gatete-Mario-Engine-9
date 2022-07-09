/// @description Draw boo

//Apply additive blending
gpu_set_blendmode(bm_add);

//Render
draw_sprite_ext(sprite_index, image_index + frame, screen_round(x), screen_round(y), xscale, 1, 0, c_white, alpha);

//Reset blending
gpu_set_blendmode(bm_normal);