/// @description Draw water

//Set blend mode
gpu_set_blendmode(bm_add);

//Draw the water
draw_sprite_ext(sprite_index, -1, x, y, room_width, 1, 0, c_white, image_alpha);

//Set colour
draw_set_colour(make_colour_rgb(0, 24, 96));
	
//Set alpha
draw_set_alpha(image_alpha);
	
//Draw rectangle
draw_rectangle(x, y + 48, room_width, room_height, false);
	
//Reset alpha
draw_set_alpha(1);

//Reset blend mode
gpu_set_blendmode(bm_normal);