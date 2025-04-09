/// @description Render water

//Set blend mode
gpu_set_blendmode(bm_add);

//Set colour
draw_set_colour(make_colour_rgb(0, 24, 96));
	
//Set alpha
draw_set_alpha(alpha);
	
//Draw rectangle
draw_rectangle(0, 0, room_width, room_height, false);
	
//Reset alpha
draw_set_alpha(1);

//Reset blend mode
gpu_set_blendmode(bm_normal);