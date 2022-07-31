/// @description Render big boo

//Set blend mode
gpu_set_blendmode(bm_add);

//If the boo has been hit
if (ready == 3)
	draw_sprite_ext(spr_boo_big_hit, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, alpha);
	
//Otherwise
else {
	
	//If the boo is not turning around
	if (sprite_index != spr_boo_big_turn)
	    draw_sprite_ext(spr_boo_big, image_index, screen_round(x), screen_round(y), xscale, 1, 0, c_white, alpha);
	else
	    draw_sprite_ext(spr_boo_big_turn, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, alpha);
}

//Reset blend mode
gpu_set_blendmode(bm_normal);