/// @function									freeze_create(surface[OPTIONAL]);
/// @param {surface} surface[OPTIONAL]			The surface to create the pre-freeze from

function freeze_create() {
	
	//The snapshot itself
	snapshot = -1;
	
	//Surface
	_indexedSurfaceVariable = (argument_count > 0) ? argument[0] : application_surface;
		
	//Create a snapshot
	snapshot = sprite_create_from_surface(_indexedSurfaceVariable, 0, 0, surface_get_width(_indexedSurfaceVariable), surface_get_height(_indexedSurfaceVariable), 0, 1, 0, 0);
		
	//Deactivate all instances
	instance_deactivate_all(true);
		
	//Activate HUD
	instance_activate_object(obj_hud);

	//Activate coordinator object
	instance_activate_object(obj_coordinator);
}

/// @function freeze_render(); 
function freeze_render() {
	
	//Draw the screenshot
	if (sprite_exists(snapshot)) {
    
	    //Disable alpha blending
	    gpu_set_blendenable(0);
		
		//Draw the snapshot
		draw_sprite_ext(snapshot, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1 / obj_coordinator. size, 1 / obj_coordinator. size, 0, c_white, 1);
		
		//Enable alpha blending
		gpu_set_blendenable(1);
	}
}