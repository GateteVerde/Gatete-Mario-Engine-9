/// @description Draw effect

//Set blend mode
gpu_set_blendmode(bm_add);

//If the object emits beams
if (beam == true) {
	
	for (i=0; i<6; i++)
		draw_sprite_ext(spr_blend_beam, -1, x, y, scale2[i], scale2[i], angle + (60 * i), image_blend, alpha2);
}

//Draw the sprite
draw_sprite_ext(sprite_index, 0, x, y, scale, scale, 0, image_blend, alpha);

//Reset blend mode
gpu_set_blendmode(bm_normal);