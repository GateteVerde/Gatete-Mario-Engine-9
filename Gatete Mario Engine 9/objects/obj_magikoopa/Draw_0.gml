/// @description Draw magikoopa

if (image_index != 0)
    draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y) + 1, xscale, 1, 0, c_white, 1);
else {

	//Set additive blend mode
    gpu_set_blendmode(bm_add);
	
	//Render me
    draw_sprite_ext(spr_magikoopa_alt, 0, screen_round(x), screen_round(y) + 1, xscale, 1, 0, c_white, image_alpha);
	
	//Set normal blend mode
    gpu_set_blendmode(bm_normal);
}
