/// @description Draw NPC

if (sprite_index != -1) {

	draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), xscale, yscale, image_angle, image_blend, image_alpha);
}