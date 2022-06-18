/// @description Spark

//Inherit the parent event
event_inherited();

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 16;
		new_radius = 16;
	}
}
