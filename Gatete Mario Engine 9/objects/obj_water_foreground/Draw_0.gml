/// @description Draw water

//Frame
var frame = (push == 0) ? -1 : 0;

//Set blend mode
gpu_set_blendmode(bm_add);

//Draw the water
draw_sprite_tiled_area_ext(sprite_index, frame, x + xx, y, x, y, x + room_width, y + 47, c_white, alpha);

//Set colour
draw_set_colour(make_colour_rgb(0, 24, 96));
	
//Set alpha
draw_set_alpha(alpha);
	
//Draw rectangle
draw_rectangle(x, y + 48, room_width, room_height, false);
	
//Reset alpha
draw_set_alpha(1);

//Reset blend mode
gpu_set_blendmode(bm_normal);