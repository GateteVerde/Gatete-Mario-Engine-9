/// @description Respawn when outside the view

//If falling down
if ((ready == 2) && (outside_view() == true)) {

	if (xstart < camera_get_view_x(view_camera[0])-sprite_width)
	|| (ystart < camera_get_view_y(view_camera[0])-sprite_height)
	|| (xstart > camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]))
	|| (ystart > camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])) {
		
		//Reset time
		time = time_rst;
		
		//Reset state
		ready = 0;
		
		//Go to start position
		x = xstart;
		y = ystart;
		
		//Stop movement
		hspeed = 0;
		vspeed = 0;
		gravity = 0;
	}        
}

//Cap vertical speed
if (vspeed > 2.5)
	vspeed = 2.5;