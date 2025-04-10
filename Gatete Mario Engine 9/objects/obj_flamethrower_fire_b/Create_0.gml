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

	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 12;
		new_radius = 12;
	}
}