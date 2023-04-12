/// @description Render me

//If this enemy is holding a bomb
if (bomb == true) {

	draw_sprite_ext(spr_bombguy, 0, screen_round(x), screen_round(y)+8, xscale, 1, 0, c_white, 1);
}

//Draw birb
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);