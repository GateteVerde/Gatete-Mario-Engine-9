/// @description Render me

//If the walrus has been squished
if (squishy == 1)
    draw_sprite_custom_origin(spr_viberus_sq, -1, screen_round(x), screen_round(y), 12, 32, xscale * fxs, fys, 0, c_white, 1);
else
    event_inherited();
