/// @description Render me

if (sprite_index != spr_boo_big_turn)
    draw_sprite_ext(spr_boo_big, movenow, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);
else
    draw_sprite_ext(spr_boo_big_turn, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);
