/// @description Render surfaces

//Copy the buffer data to the surface
if (!surface_exists(BufferSurface)) {
	
   BufferSurface = surface_create(room_width, room_height);
   buffer_set_surface(buff, BufferSurface, 0);
}
   
//If the final surface does not exist
if (!surface_exists(FinalSurface)) { 
	
	//Create it
	FinalSurface = surface_create(WIDTH, HEIGHT); 	
}

//Otherwise, if it exists
else {
	
	//Set the surface target
	surface_set_target(FinalSurface);
	   
	//Clear alpha in white
	draw_clear_alpha(c_white,0);
		
	//Draw the tiles
	draw_surface(BufferSurface, screen_round(-camera_x+extra/2), screen_round(-camera_y+extra/2));
		
	//Make "holes" in the tile surface
	//Change this code to draw rectangles inbetween the bridge edges
	//Remember to offset it by the negative of the view's position
	draw_set_alpha(1);
	
	//Set substractive blending mode
	gpu_set_blendmode(bm_subtract);
	
	//If there's wandering pits placed
	if (instance_number(obj_wanderingpit) > 0) {
	
		//With ALL obj_wanderingpit
		with (obj_wanderingpit) {
			
			//Draw a rectangle
			draw_rectangle_color(x - other.camera_x, y - other.camera_y, (bbox_right + 8) - other.camera_x, y + 23 - other.camera_y, c_white, c_white, c_white, c_white, 0);
		}
	}

	//Set normal blending mode
	gpu_set_blendmode(bm_normal);
	
	//Reset alpha
	draw_set_alpha(1);
			
	//Reset surface target
	surface_reset_target();
	  
	//Draw surface
	draw_surface(FinalSurface, screen_round(camera_x-extra/2), screen_round(camera_y-extra/2));	
}
