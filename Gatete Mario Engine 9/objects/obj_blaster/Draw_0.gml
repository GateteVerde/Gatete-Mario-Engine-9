/// @description Render cannon

//Top
draw_sprite_ext(sprite_index, 0, round(x), round(y), 1, 1, 0, c_white, 1);

//Middle / Bottom
if (image_yscale > 1) {

    draw_sprite_ext(sprite_index, 1, round(x), round(y)+16, 1, 1, 0, c_white, 1);
    if (image_yscale >= 2) {
    
        draw_sprite_ext(sprite_index, 2, round(x), round(y)+32, 1, image_yscale-2, 0, c_white, 1);
    }
}
