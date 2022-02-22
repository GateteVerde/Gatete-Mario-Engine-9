/// @description Draw smoke and stars

//Draw smoke
draw_sprite(sprite_index, -1, screen_round(x), screen_round(y));

//Draw stars
if (starstop == 0) {

    draw_sprite(spr_spinstar, 0, screen_round(x) + starx, screen_round(y) + stary)
    draw_sprite(spr_spinstar, 0, screen_round(x) + starx, screen_round(y) - stary)
    draw_sprite(spr_spinstar, 0, screen_round(x) - starx, screen_round(y) + stary)
    draw_sprite(spr_spinstar, 0, screen_round(x) - starx, screen_round(y) - stary)
}

