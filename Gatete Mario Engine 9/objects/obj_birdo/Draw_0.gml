/// @description Render NPC

//Palette
pal_swap_set(spr_palette_birdo, type);

//Draw bow
if (bowtie) {

	//Set bowtie frame
	var frame = (sprite_index == spr_birdo_damage) ? 1 : 0;
	
	//Draw bow tie
	draw_sprite_ext(spr_birdo_bowtie, frame, screen_round(x), screen_round(y + 1), xscale, yscale, image_angle, image_blend, image_alpha);
}

//Draw NPC
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), xscale, yscale, image_angle, image_blend, image_alpha);

//Reset palette
pal_swap_reset();