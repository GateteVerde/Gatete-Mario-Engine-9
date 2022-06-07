/// @description Render cannon

//Cannon
draw_sprite_ext(sprite_index, direct/45, x, y, 1, 1, 0, c_white, 1);

//Base
if (d == 1)
    draw_sprite(sprite_index, 8, x, y);
else if (u == 1)
    draw_sprite(sprite_index, 9, x, y);
else if (r == 1)
    draw_sprite(sprite_index, 10, x, y);
else if (l == 1)
    draw_sprite(sprite_index, 11, x, y);
