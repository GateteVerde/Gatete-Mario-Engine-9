/// @description Render me

//Render ostro
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);

//If the rider does exist
if (instance_exists(rider)) {

	draw_sprite_ext(spr_shyguy, 1, screen_round(x) - 6 * sign(xscale), screen_round(y) - 14, xscale, 1, 0, c_white, 1);
}
