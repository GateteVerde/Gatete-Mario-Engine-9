/// @description Draw vegetable

if ((drawpiece) && (ready < 2)) {

    if (drawpiece2 == 0)
        draw_sprite_part_ext(sprite_index, -1, 0, 0, sprite_width, 3, x-8, y+5, 1, 1, c_white, 1)
    else if (drawpiece2 == 1)
        draw_sprite_part_ext(sprite_index, -1, 0, 0, sprite_width, 6, x-8, y+2, 1, 1, c_white, 1)
    else if (drawpiece2 == 2)
        draw_sprite_part_ext(sprite_index, -1, 0, 0, sprite_width, 9, x-8, y-1, 1, 1, c_white, 1)
}
else {

    if (drawpiece2 == 3)
		draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);
}