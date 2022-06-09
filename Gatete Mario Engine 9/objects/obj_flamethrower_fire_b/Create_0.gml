/// @description Flamethrower Fire

//Inherit event
event_inherited();

//Ignore moving platforms
ignore_platforms = true;

//Depth
depth = 150;
alarm[3] = 12;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}