/// @description Draw Kuribo Shoe Goomba

//Draw Shoe
draw_sprite_ext(spr_shoe_kuribo, anim, screen_round(x), screen_round(y)+1, xscale, 1, 0, c_white, 1);

//Draw Goomba
if (ready == 1) {
	
    draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)-15, xscale, 1, 0, c_white, 1);
}