/// @description Draw powerup and inventory

//Draw the item
if (image_alpha > 0) {

    if (sprite_index != spr_3up)
        draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 0, c_white, alpha);
    else
        draw_sprite_ext(sprite_index, -1, x-8, y, 1, 1, 0, c_white, alpha);
}