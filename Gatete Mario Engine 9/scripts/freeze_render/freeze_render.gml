/// @function freeze_render(); 

function freeze_render() {
	
	//Draw the screenshot
	if (sprite_exists(snapshot)) {
    
	    //Disable alpha blending
	    gpu_set_blendenable(0);
		
		//Draw the snapshot
		if (event_type == ev_gui)
			draw_sprite_ext(snapshot, 0, 0, 0, 1 * obj_coordinator. size, 1 / obj_coordinator. size, 0, c_white, 1);
		else
			draw_sprite_ext(snapshot, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1 / obj_coordinator. size, 1 / obj_coordinator. size, 0, c_white, 1);
		
		//Enable alpha blending
		gpu_set_blendenable(1);
	}
}