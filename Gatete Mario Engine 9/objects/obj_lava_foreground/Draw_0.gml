/// @description Draw lava

var pal = obj_levelcontrol.lava_palette;

//Set up palette
pal_swap_set(spr_palette_lava, pal);

//Draw the water
draw_sprite_ext(sprite_index, -1, x, y, room_width, 1, 0, c_white, image_alpha);

//Set colour
draw_set_colour(make_colour_rgb(192, 0, 0));
	
//Draw rectangle
draw_rectangle(x, y + 48, room_width, room_height, false);

//Reset palette
pal_swap_reset();