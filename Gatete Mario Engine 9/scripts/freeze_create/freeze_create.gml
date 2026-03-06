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