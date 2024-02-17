/// @description Render me

//Update frame
frame += 0.5;

//Show a flare
if (offset != 0) {

	draw_sprite_ext(spr_fuse, frame, screen_round(x) + offset, screen_round(y - 4 + (6 * image_index)), dir, yscale, image_angle, image_blend, image_alpha);
}

//Render me
draw_sprite_ext(sprite_index, image_index, screen_round(x) + offset, screen_round(y + 1), dir, yscale, image_angle, image_blend, image_alpha);