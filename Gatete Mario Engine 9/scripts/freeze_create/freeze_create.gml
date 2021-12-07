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

	//Create pre-freeze
	if (global.prefreeze == noone) {
		
		global.prefreeze = surface_create(surface_get_width(_indexedSurfaceVariable), surface_get_height(_indexedSurfaceVariable));
		surface_copy(global.prefreeze, 0, 0, _indexedSurfaceVariable);
	}

	//Make objects invisible
	if (!_indexedFreezePersistentVariable) {
		
		for (var i = 0; i < array_length(global.keep_activated); i ++) {
			
			with (global.keep_activated[i])
				visible = false;			
		}
	}
	
	//Set up actual final surface
	var _temp = function() {
	
		//Destroy pre-freeze
		surface_free(global.prefreeze);
		global.prefreeze = noone;
		
		//Deactivate all instances
		instance_deactivate_all(true);
		
		//Activate HUD
		instance_activate_object(obj_hud);

		//Activate coordinator object
		instance_activate_object(obj_coordinator);
		
		//Create a snapshot
		snapshot = sprite_create_from_surface(_indexedSurfaceVariable, 0, 0, surface_get_width(_indexedSurfaceVariable), surface_get_height(_indexedSurfaceVariable), 0, 0, 0, 0);
		
		//Make objects visible
		if (!_indexedFreezePersistentVariable) {
			
			for (var i = 0; i < array_length(global.keep_activated); i ++) {
			
				instance_activate_object(global.keep_activated[i]);
				with (global.keep_activated[i])
					visible = true;			
			}
		}
	}
	
	//Run _temp function
	timer(_temp, 0.1, false);
}

/// @function									freeze_render();                                 freeze_render()
function freeze_render() {
	
	//Draw the screenshot.
	if (sprite_exists(snapshot)) {
    
	    //Draw the screenshot
	    draw_sprite_ext(snapshot, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1 / obj_coordinator.size, 1 / obj_coordinator.size, 0, c_white, 1);
	}
}