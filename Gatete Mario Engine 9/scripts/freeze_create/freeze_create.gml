//Every object that will stay persistent during the freeze needs to be placed in this array
global.keep_activated = [

	obj_water_foreground,
	obj_rainmaker,
	obj_effectsparent	
]

/// @function									freeze_create(surface[OPTIONAL]);
/// @param {bool} freeze_persistent[OPTIONAL]	If the objects from the keep_activated array should freeze anyway
/// @param {surface} surface[OPTIONAL]			The surface to create the pre-freeze from
function freeze_create() {
	
	//The snapshot itself
	snapshot = -1;
	
	//Surface
	_indexedSurfaceVariable = (argument_count > 1) ? argument[1] : application_surface;
	_indexedFreezePersistentVariable = (argument_count > 0) ? argument[0] : false;
	
	//Make objects invisible
	if (!_indexedFreezePersistentVariable) {
		
		for (var i = 0; i < array_length(global.keep_activated); i ++) {
			
			with (global.keep_activated[i])
				visible = false;			
		}
	}
		
	//Create a snapshot
	snapshot = sprite_create_from_surface(_indexedSurfaceVariable, 0, 0, surface_get_width(_indexedSurfaceVariable), surface_get_height(_indexedSurfaceVariable), 0, 1, 0, 0);
		
	//Deactivate all instances
	instance_deactivate_all(true);
		
	//Activate HUD
	instance_activate_object(obj_hud);

	//Activate coordinator object
	instance_activate_object(obj_coordinator);
		
	//Make objects visible
	if (!_indexedFreezePersistentVariable) {
			
		for (var i = 0; i < array_length(global.keep_activated); i ++) {
			
			instance_activate_object(global.keep_activated[i]);
			with (global.keep_activated[i])
				visible = true;			
		}
	}
}

/// @function freeze_activate();
function freeze_activate() {

	//Make objects visible
	if (!_indexedFreezePersistentVariable) {
			
		for (var i = 0; i < array_length(global.keep_activated); i ++) {
			
			instance_activate_object(global.keep_activated[i]);
			with (global.keep_activated[i]) {
				
				depth = -101;
				visible = true;
			}
		}
	}
}

/// @function freeze_render(); 
function freeze_render() {
	
	//Draw the screenshot
	if (sprite_exists(snapshot)) {
    
	    //Disable alpha blending
	    gpu_set_blendenable(0);
		
		//Draw the snapshot
		draw_sprite_ext(snapshot, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1 / obj_coordinator.size, 1 / obj_coordinator.size, 0, c_white, 1);
		
		//Enable alpha blending
		gpu_set_blendenable(1);
	}
}
