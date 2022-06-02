/// @description Draw the surface

//Copy the buffer data to the surface
if (!surface_exists(BufferSurface)) {
	
	BufferSurface = surface_create(room_width,room_height);
	buffer_set_surface(buff,BufferSurface,0);
}
   
//Draw the final surface
if (!surface_exists(FinalSurface)) { 
	
	FinalSurface=surface_create(WIDTH,HEIGHT); 	
}
else {
	
	surface_set_target(FinalSurface);
	   
	draw_clear_alpha(c_white,0);
		
	//Draw the tiles
	draw_surface(BufferSurface,-camera_x+extra/2,-camera_y+extra/2);
		
	//Make "holes" in the tile surface
	//Change this code to draw rectangles inbetween the bridge edges
	//Remember to offset it by the negative of the view's position
	draw_set_alpha(1);
	gpu_set_blendmode(bm_subtract);
		
	with (obj_wanderingpit) {
				
		draw_rectangle_color(bbox_left-other.camera_x, bbox_top-other.camera_y, bbox_right-1-other.camera_x, bbox_bottom-other.camera_y, c_white, c_white, c_white, c_white, 0);		
	}
			
	gpu_set_blendmode(bm_normal);
	
	draw_set_alpha(1);
				
	surface_reset_target();
	  
	draw_surface(FinalSurface,camera_x-extra/2,camera_y-extra/2);
	
}
